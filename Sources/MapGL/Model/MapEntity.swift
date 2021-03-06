/// Base map entity, represents real object on map, such as building, road and others.
open class MapEntity: MapObject {

	/// 2GIS Firm, building, street identifier
	public let entityId: String

	/// Create new instance of firm, building, road and others
	/// - Parameter id: 2GIS Firm or building identifier
	public override init(id: String) {
		self.entityId = id
		super.init()
	}

}

extension MapEntity: ISelectable {

	public func select() {
		self.show()
	}

	public func deselect() {
		self.hide()
	}

}

extension MapEntity: IHideable {

	public func show() {
		self.evaluateJS(self.createJSCode())
	}

	public func hide() {
		self.evaluateJS(self.destroyJSCode())
	}

}

internal extension MapEntity {

	override func createJSCode() -> String {
		let js = """
		window.selectObject("\(self.entityId)");
		"""
		return js
	}

	override func destroyJSCode() -> String {
		let js = """
		window.deselectObject("\(self.entityId)");
		"""
		return js
	}

}
