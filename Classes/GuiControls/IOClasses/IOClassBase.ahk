﻿; All IOClasses derive from this class.
class IOClassBase extends _UCR.Classes.IOClasses.BindObject {
	static IOClass := 0
	static IOType := 0		; 0 for Input, 1 for Output
	DeviceID := 0 		; Device ID, eg Stick ID for Joystick input or vGen output
	Binding := []		; Codes of the input(s) for the Binding.
					; Normally a single element, but for KBM could be up to 4 modifiers plus a key/button
	BindOptions := {}	; Options for Binding - eg wild / block for KBM

	IsBound(){
		return (this.DeviceID && this.Binding.length())
	}
	
	__New(parent, obj := 0){
		this.ParentControl := parent
		if (obj == 0){
			obj := {}
		}
		this._Deserialize(obj)
	}
	
	_Serialize(){
		return {Binding: this.Binding, BindOptions: this.BindOptions, IOClass: this.IOClass, DeviceID: this.DeviceID}
	}
	
	UpdateMenus(cls){
	}

	_Deserialize(obj){
		if (ObjHasKey(obj, "DeviceID"))
			this.DeviceID := obj.DeviceID
		if (ObjHasKey(obj, "Binding"))
			this.Binding := obj.Binding
		if (ObjHasKey(obj, "BindOptions"))
			this.BindOptions := obj.BindOptions
	}
}