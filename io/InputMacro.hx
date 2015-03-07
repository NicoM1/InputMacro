package io;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.Json;
#if macro
import sys.io.File;
#end

class InputMacro {
	/**
	 * Builds input testing functions based on input.json file
	 */
	macro static public function buildInput(): Array<Field> {
		var fields = Context.getBuildFields();
		
		var type = TPath({
			pack: ["io"],
			params: null,
			name: "InputAction",
		});
		
		var input: Array<Action>;
		try {
			input = cast Json.parse(File.getContent("assets/input.json")).actions;
		}
		catch (e: Dynamic) {
			throw "input.json is invalid: " + e;
		}
		
		for (i in input) {
			var name = i.name;
			var codes: Array<String> = cast i.codes;
			var newField = {
				name: name,
				pos: Context.currentPos(),
				access: [APublic, AStatic],
				kind: FVar(type, macro new InputAction($v{codes}))
			};
			fields.push(newField);
		}
		
		return fields;
	}
}

typedef Action = {
	name: String,
	codes: Array<String>
}