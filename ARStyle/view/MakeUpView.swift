/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The app's content view.
*/

import SwiftUI
import RealityKit
import ARKit
import Combine
import simd
import PencilKit

struct MakeUpView: View {
    var canvasView = PKCanvasView()
    @State var type:Int=0
    var imgType = ["1.circle.fill","2.circle.fill","3.circle.fill","4.circle.fill","5.circle.fill","6.circle.fill","7.circle.fill"]

    var body: some View {
        ZStack {
            ARViewContainer2(makeUp: $type, canvasView: canvasView)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0..<imgType.count, id:\.self) {
                                id in
                                Button(action: {
                                    type=id
                                }){
                                        Image(systemName: imgType[id]).resizable()
                                            .frame(width: 63.0, height: 63.0)
                                }
                            }
                        }
                    }
            }
        }
    }
}

struct ARViewContainer2: UIViewRepresentable {
    @Binding var makeUp:Int
    
    let canvasView: PKCanvasView

    func makeUIView(context: Context) -> FacePaintingView {
        let arView = FacePaintingView(frame: .zero)
        arView.setup(canvasView: canvasView)
        return arView
        
    }
    
    func updateUIView(_ uiView: FacePaintingView, context: Context) {
        uiView.setMakeUp(makeUp: makeUp)
        DispatchQueue.main.async {
            uiView.becomeFirstResponder()
        }
    }
    
}

extension float4x4 {
    public func transform(position p: SIMD3<Float>) -> SIMD3<Float> {
        var result = self * SIMD4<Float>(x: p.x, y: p.y, z: p.z, w: 1)
        result /= result.w
        return SIMD3<Float>(result.x, result.y, result.z)
    }
}

struct Ray {
    let origin: SIMD3<Float>
    let direction: SIMD3<Float>
}

struct RaycastResult {
    let position: SIMD3<Float>
    let uv: SIMD2<Float>
    
    init?(ray: Ray, entity: HasModel) {
        let worldTransform = entity.transformMatrix(relativeTo: nil)

        for model in entity.model!.mesh.contents.models {
            for part in model.parts {
                let positions = part.positions.elements
                let indices = part.triangleIndices!.elements
                let uvs = part.textureCoordinates!.elements
                for i in 0..<indices.count / 3 {
                    let i0 = Int(indices[i * 3])
                    let i1 = Int(indices[i * 3 + 1])
                    let i2 = Int(indices[i * 3 + 2])

                    let v0 = worldTransform.transform(position: positions[i0])
                    let v1 = worldTransform.transform(position: positions[i1])
                    let v2 = worldTransform.transform(position: positions[i2])

                    let e1 = v1 - v0
                    let e2 = v2 - v0
                    let h = cross(ray.direction, e2)
                    let det = dot(e1, h)
                    if abs(det) < 1E-6 {
                        continue
                    }
                    let inv_det = 1.0 / det
                    let s = ray.origin - v0
                    let u = inv_det * dot(s, h)
                    if u < 0 || u > 1 {
                        continue
                    }
                    let q = simd_cross(s, e1)
                    let v = inv_det * dot(ray.direction, q)
                    if v < 0 || u + v > 1 {
                        continue
                    }
                    let t = inv_det * dot(e2, q)
                    if t < 1E-4 {
                        continue
                    }
                    let point = ray.origin + ray.direction * t

                    let uv0 = uvs[i0]
                    let uv1 = uvs[i1]
                    let uv2 = uvs[i2]
                    let w1 = u
                    let w2 = v
                    let w0 = 1 - w1 - w2
                    let uv = uv0 * w0 + uv1 * w1 + uv2 * w2

                    self.position = point
                    self.uv = uv
                    return
                }
            }
        }
        return nil
    }
}

class FacePaintingView: ARView, PKCanvasViewDelegate {

    var lastTouchPoint: UITouch?
    var startNewLine = false
    var subscription: Cancellable?
    var faceEntity: HasModel? = nil
    var canvasView: PKCanvasView!
    var makeUp:Int=0

    static let sceneUnderstandingQuery = EntityQuery(where: .has(SceneUnderstandingComponent.self) && .has(ModelComponent.self))

    required init(frame: CGRect) {
        super.init(frame: frame)
        isMultipleTouchEnabled = true
        updateFaceTextureWithLatestDrawing()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        isMultipleTouchEnabled = true
    }
    
    func setMakeUp(makeUp:Int){
        self.makeUp=makeUp
        updateFaceTextureWithLatestDrawing()
    }

    override var canBecomeFirstResponder: Bool {
        true
    }

    func setup(canvasView: PKCanvasView) {
        self.canvasView = canvasView
        self.canvasView.delegate = self


        let configuration = ARFaceTrackingConfiguration()
        session.run(configuration)

        subscription = scene.subscribe(to: SceneEvents.Update.self, onUpdate)

        let anchorEntity = AnchorEntity(.world(transform: .init(diagonal: [1, 1, 1, 1])))

        scene.anchors.append(anchorEntity)
    }

    func updateFaceTextureWithLatestDrawing() {
        switch(makeUp){
            case 0:
                let imag2 = UIImage(named: "autumn_eyeshadow_1.png")!
                let imag3 = UIImage(named: "autumn_eyeliner_1.png")!
                let imag4 = UIImage(named: "autumn_blush_3.png")!
                let imag5 = UIImage(named: "autumn_lipstick_3.png")!
                let newImage = imag2.mergeWith(topImage: imag3).mergeWith(topImage: imag4).mergeWith(topImage: imag5)
                updateFaceEntityTextureUsing(cgImage: (newImage.cgImage)!)
            case 1:
                let imag2 = UIImage(named: "spring_eyeshadow_2.png")!
                let imag3 = UIImage(named: "spring_eyeliner_2.png")!
                let imag4 = UIImage(named: "spring_blush_2.png")!
                let imag5 = UIImage(named: "spring_lipstick_1.png")!
                let newImage = imag2.mergeWith(topImage: imag3).mergeWith(topImage: imag4).mergeWith(topImage: imag5)
                updateFaceEntityTextureUsing(cgImage: (newImage.cgImage)!)
            case 2:
                let imag2 = UIImage(named: "summer_eyeshadow_2.png")!
                let imag3 = UIImage(named: "summer_eyeliner_2.png")!
                let imag4 = UIImage(named: "summer_blush_3.png")!
                let imag5 = UIImage(named: "summer_lipstick_3.png")!
                let newImage = imag2.mergeWith(topImage: imag3).mergeWith(topImage: imag4).mergeWith(topImage: imag5)
                updateFaceEntityTextureUsing(cgImage: (newImage.cgImage)!)
            case 3:
                let imag2 = UIImage(named: "winter_eyeshadow_3.png")!
                let imag3 = UIImage(named: "winter_eyeliner_1.png")!
                let imag4 = UIImage(named: "winter_blush_3.png")!
                let imag5 = UIImage(named: "winter_lipstick_2.png")!
                let newImage = imag2.mergeWith(topImage: imag3).mergeWith(topImage: imag4).mergeWith(topImage: imag5)
                updateFaceEntityTextureUsing(cgImage: (newImage.cgImage)!)
            case 4:
                let imag2 = UIImage(named: "winter_eyeshadow_2.png")!
                let imag3 = UIImage(named: "winter_eyeliner_2.png")!
                let imag4 = UIImage(named: "winter_blush_3.png")!
                let imag5 = UIImage(named: "winter_lipstick_3.png")!
                let newImage = imag2.mergeWith(topImage: imag3).mergeWith(topImage: imag4).mergeWith(topImage: imag5)
                updateFaceEntityTextureUsing(cgImage: (newImage.cgImage)!)
            case 5:
                let imag2 = UIImage(named: "summer_eyeshadow_1.png")!
                let imag3 = UIImage(named: "summer_eyeliner_1.png")!
                let imag4 = UIImage(named: "summer_blush_2.png")!
                let imag5 = UIImage(named: "summer_lipstick_1.png")!
                let newImage = imag2.mergeWith(topImage: imag3).mergeWith(topImage: imag4).mergeWith(topImage: imag5)
                updateFaceEntityTextureUsing(cgImage: (newImage.cgImage)!)
            case 6:
                let imag2 = UIImage(named: "spring_eyeshadow_3.png")!
                let imag3 = UIImage(named: "spring_eyeliner_3.png")!
                let imag4 = UIImage(named: "spring_blush_3.png")!
                let imag5 = UIImage(named: "spring_lipstick_3.png")!
                let newImage = imag2.mergeWith(topImage: imag3).mergeWith(topImage: imag4).mergeWith(topImage: imag5)
                updateFaceEntityTextureUsing(cgImage: (newImage.cgImage)!)
            default:
                break
        }
    }

    func updateFaceEntityTextureUsing(cgImage: CGImage) {
        guard let faceEntity = self.faceEntity,
                let faceTexture = try? TextureResource.generate(from: cgImage,
                                                                options: .init(semantic: .color))
        else { return }

        var faceMaterial = PhysicallyBasedMaterial()
        faceMaterial.baseColor.texture = PhysicallyBasedMaterial.Texture(faceTexture)
        faceMaterial.opacityThreshold = -1


        faceEntity.model!.materials = [faceMaterial]
    }

    /// This method sets a new drawing and registers an undo action to go back to the previous drawing.
    func setDrawingUndoable(_ drawing: PKDrawing) {
        updateFaceTextureWithLatestDrawing()
    }

    /// This method finds the face model in a scene and returns it.
    func findFaceEntity(scene: RealityKit.Scene) -> HasModel? {

        let faceEntity = scene.performQuery(Self.sceneUnderstandingQuery).first {
            $0.components[SceneUnderstandingComponent.self]?.entityType == .face
        }

        return faceEntity as? HasModel
    }

    func onUpdate(_ event: Event) {
        guard let faceEntity = self.faceEntity else {
            self.faceEntity = findFaceEntity(scene: scene)
            return
        }
        guard let lastTouchPoint = lastTouchPoint else {
            return
        }

        let lastTouchLocation = lastTouchPoint.location(in: self)

        guard let ray = self.ray(through: lastTouchLocation),
              let raycastResult = RaycastResult(ray: Ray(origin: ray.origin, direction: ray.direction), entity: faceEntity) else {
            return
        }

        let uv = raycastResult.uv

        guard let inkTool = canvasView.tool as? PKInkingTool else {
            print("Unsupported Tool")
            return
        }

        let frameSize = canvasView.frame.size

        let newLocation = CGPoint(x: CGFloat(uv.x) * frameSize.width, y: CGFloat(uv.y) * frameSize.height)
        let newPoint = PKStrokePoint(location: newLocation,
                                     timeOffset: 0,
                                     size: CGSize(width: max(3, inkTool.width), height: max(3, inkTool.width)),
                                     opacity: inkTool.color.cgColor.alpha,
                                     force: lastTouchPoint.force,
                                     azimuth: lastTouchPoint.azimuthAngle(in: self),
                                     altitude: lastTouchPoint.altitudeAngle
        )

        if startNewLine {
            startNewLine = false
            let drawingToUndoTo = canvasView.drawing
            undoManager?.registerUndo(withTarget: self) {
                $0.setDrawingUndoable(drawingToUndoTo)
            }

            let newStrokePath = PKStrokePath(controlPoints: [newPoint], creationDate: NSDate.now)
            let newStroke = PKStroke(ink: inkTool.ink, path: newStrokePath)
            canvasView.drawing.strokes.append(newStroke)
        } else {
            let lastStroke = canvasView.drawing.strokes.last!
            var points = lastStroke.path.map { $0 }
            points.append(newPoint)
            let newStrokePath = PKStrokePath(controlPoints: points, creationDate: NSDate.now)
            canvasView.drawing.strokes[canvasView.drawing.strokes.endIndex - 1].path = newStrokePath
        }

        updateFaceTextureWithLatestDrawing()
    }
}

extension FacePaintingView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchPoint = touches.first
        startNewLine = true
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchPoint = touches.first
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchPoint = nil
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchPoint = nil
    }
}

extension FacePaintingView: PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        updateFaceTextureWithLatestDrawing()
    }
}

extension UIImage {
  func mergeWith(topImage: UIImage) -> UIImage {
    let bottomImage = self

    UIGraphicsBeginImageContext(size)


    let areaSize = CGRect(x: 0, y: 0, width: bottomImage.size.width, height: bottomImage.size.height)
    bottomImage.draw(in: areaSize)

    topImage.draw(in: areaSize, blendMode: .normal, alpha: 1.0)

    let mergedImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return mergedImage
  }
}

#if DEBUG
struct MakeUpView_Previews: PreviewProvider {
    static var previews: some View {
        MakeUpView()
    }
}
#endif
