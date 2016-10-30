/*!
*  Fancy Form is light form JavaScript library on JQuery
*/
"use strict";
var Mt = {
	global: this,
	version: "0.0.4"
};
Mt.apply = function(c, b) {
	for (var a in b) {
		c[a] = b[a]
	}
};
Mt.applyIf = function(c, b) {
	for (var a in b) {
		if (c[a] === undefined) {
			c[a] = b[a]
		}
	}
};
Mt.namespace = function() {
	var d = 0,
	a = arguments.length;
	for (; d < a; d++) {
		var f = arguments[d],
		g = f.split("."),
		c = 1,
		b = g.length;
		Mt.global[g[0]] = Mt.global[g[0]] || {};
		var e = Mt.global[g[0]];
		for (; c < b; c++) {
			e[g[c]] = e[g[c]] || {};
			e = e[g[c]]
		}
	}
};
Mt.ns = Mt.namespace;
Mt.typeOf = function(b) {
	if (b === null) {
		return "null"
	}
	var a = typeof b;
	if (a === "undefined" || a === "string" || a === "number" || a === "boolean") {
		return a
	}
	var c = Object.prototype.toString,
	d = c.call(b);
	switch (d) {
	case "[object Array]":
		return "array";
	case "[object Date]":
		return "date";
	case "[object Boolean]":
		return "boolean";
	case "[object Number]":
		return "number";
	case "[object RegExp]":
		return "regexp"
	}
	if (a === "function") {
		return "function"
	}
	if (a === "object") {
		return "object"
	}
};
Mt.isArray = ("isArray" in Array) ? Array.isArray: function(a) {
	var b = Object.prototype.toString;
	return b.call(a) === "[object Array]"
};
Mt.isObject = function(a) {
	var b = Object.prototype.toString;
	return b.call(a) === "[object Object]"
};
Mt.isFunction = function(a) {
	var b = Object.prototype.toString;
	return b.apply(a) === "[object Function]"
};
Mt.isString = function(a) {
	return typeof a === "string"
};
Mt.isNumber = function(a) {
	return typeof a === "number" && isFinite(a)
};
Mt.isBoolean = function(a) {
	return typeof a === "boolean"
};
Mt.each = function(g, f) {
	var c = g,
	e = Mt.typeOf(g);
	switch (e) {
	case "array":
		var d = 0,
		b = c.length;
		for (; d < b; d++) {
			f(g[d], d, g)
		}
		break;
	case "object":
		var h;
		for (h in g) {
			f(g[h], h, g)
		}
		break
	}
};
Mt.trait = function(f, m) {
	if (m.classes) {
		var e = 0,
		c = m.classes,
		a = c.length;
		if (Mt.typeOf(m.classes[0]) === "object") {
			for (; e < a; e++) {
				var n = c[e],
				g = n._class,
				b = n.methods,
				d = 0,
				l = b.length;
				for (; d < l; d++) {
					var k = b[d];
					f[k] = g.prototype[k]
				}
			}
		} else {
			for (; e < a; e++) {
				Mt.apply(f, c[e]["prototype"])
			}
		}
	}
	if (m.methods) {
		var e = 0,
		b = m.methods,
		a = b.length,
		h;
		for (; e < a; e++) {
			h = b[e];
			f[h.name] = h.method
		}
	}
};
Mt.applyConfig = function(b, a) {
	var c, a = a || {};
	if (b._isConfigApplied === true) {
		return b
	}
	for (c in a) {
		b[c] = a[c]
	}
	b._isConfigApplied = true;
	return b
};
Mt.apply(Mt, {
	prefix: "mt-gen",
	idSeed: 0,
	id: function(a, b) {
		if (!a) {
			return (b || Mt.prefix) + (++Mt.idSeed)
		}
		a = a.dom || {};
		if (!a.id) {
			a.id = (b || Mt.prefix) + (++Mt.idSeed)
		}
		return a.id
	}
});
Mt.Collection = function(a) {
	var d = this;
	d.items = [];
	d.keys = [];
	d.map = {};
	d.indexMap = {};
	d.length = 0;
	if (a) {
		if (a.length > 0) {
			var c = 0,
			b = a.length;
			for (; c < b; c++) {
				d.add(c, a[c])
			}
		} else {
			for (var e in a) {
				d.add(e, a[e])
			}
		}
	}
};
Mt.Collection.prototype = {
	add: function(a, c) {
		var b = this;
		b.items.push(c);
		b.keys.push(a);
		b.map[a] = c;
		b.indexMap[a] = b.length;
		b.length++
	},
	remove: function(b) {
		var c = this,
		a = c.indexMap[b];
		c.items.splice(a, 1);
		c.keys.splice(a, 1);
		delete c.indexMap[a];
		delete c.map[b];
		c.length--
	},
	removeAll: function() {
		var a = this;
		a.items = [];
		a.keys = [];
		a.indexMap = {};
		a.map = {};
		a.length = 0
	},
	get: function(a) {
		var b = this;
		return b.map[a]
	},
	each: function(c) {
		var d = this,
		b = 0,
		a = d.length;
		for (; b < a; b++) {
			c(d.keys[b], d.items[b], b, d.length)
		}
	}
};
Mt.Template = function(a) {
	var b = this;
	b.tpl = a.join("");
	b.compile()
};
Mt.Template.prototype = {
	re: /\{([\w\-]+)\}/g,
	getHTML: function(a) {
		var c = this,
		b;
		return c.compiled(a)
	},
	compile: function() {
		var me = this,
		sep = "+";
		function fn(m, name) {
			name = "values['" + name + "']";
			return "'+(" + name + " === undefined ? '' : " + name + ")+'"
		}
		eval("me.compiled = function(values){ return '" + me.tpl.replace(me.re, fn) + "';};");
		return me
	}
};
Mt.key = {
	BACKSPACE: 8,
	TAB: 9,
	ENTER: 13,
	RETURN: 13,
	SHIFT: 16,
	CTRL: 17,
	ALT: 18,
	ESC: 27,
	END: 35,
	HOME: 36,
	LEFT: 37,
	UP: 38,
	RIGHT: 39,
	DOWN: 40,
	INSERT: 45,
	DELETE: 46,
	ZERO: 48,
	ONE: 49,
	TWO: 50,
	THREE: 51,
	FOUR: 52,
	FIVE: 53,
	SIX: 54,
	SEVEN: 55,
	EIGHT: 56,
	NINE: 57,
	NUM_ZERO: 96,
	NUM_ONE: 97,
	NUM_TWO: 98,
	NUM_THREE: 99,
	NUM_FOUR: 100,
	NUM_FIVE: 101,
	NUM_SIX: 102,
	NUM_SEVEN: 103,
	NUM_EIGHT: 104,
	NUM_NINE: 105,
	NUM_PLUS: 107,
	NUM_MINUS: 109,
	A: 65,
	B: 66,
	C: 67,
	D: 68,
	E: 69,
	F: 70,
	G: 71,
	H: 72,
	I: 73,
	J: 74,
	K: 75,
	L: 76,
	M: 77,
	N: 78,
	O: 79,
	P: 80,
	Q: 81,
	R: 82,
	S: 83,
	T: 84,
	U: 85,
	V: 86,
	W: 87,
	X: 88,
	Y: 89,
	Z: 90
};
Mt.Key = {
	isNum: function(b) {
		var a = Mt.key;
		switch (b) {
		case a.ZERO:
		case a.ONE:
		case a.TWO:
		case a.THREE:
		case a.FOUR:
		case a.FIVE:
		case a.SIX:
		case a.SEVEN:
		case a.EIGHT:
		case a.NINE:
		case a.NUM_ZERO:
		case a.NUM_ONE:
		case a.NUM_TWO:
		case a.NUM_THREE:
		case a.NUM_FOUR:
		case a.NUM_FIVE:
		case a.NUM_SIX:
		case a.NUM_SEVEN:
		case a.NUM_EIGHT:
		case a.NUM_NINE:
			return true;
		default:
			return false
		}
	},
	isNumControl: function(d, b) {
		var a = Mt.key;
		if (Mt.Key.isNum(d)) {
			return true
		}
		if (b.shiftKey && d === 187) {
			return true
		}
		switch (d) {
		case a.NUM_PLUS:
		case 189:
		case a.NUM_MINUS:
		case a.BACKSPACE:
		case a.DELETE:
		case a.TAB:
		case a.ENTER:
		case a.RETURN:
		case a.SHIFT:
		case a.CTRL:
		case a.ALT:
		case a.ESC:
		case a.END:
		case a.HOME:
		case a.LEFT:
		case a.UP:
		case a.RIGHT:
		case a.DOWN:
		case a.INSERT:
		case a.DELETE:
		case a.DELETE:
			return true;
			break;
		default:
			return false
		}
	}
}; (function() {
	var c = {},
	b = {};
	var d = function(f, e) {
		for (var g in e.prototype) {
			if (f.prototype[g] === undefined) {
				f.prototype[g] = e.prototype[g]
			}
		}
	};
	var a = function() {};
	a.prototype = {
		items: new Mt.Collection(),
		add: function(g, j) {
			var k = g.split("."),
			f = 1,
			e = k.length - 1;
			Mt.ns(g);
			var h = Mt.global[k[0]];
			for (; f < e; f++) {
				h = h[k[f]]
			}
			if (k.length > 1) {
				h[k[k.length - 1]] = j
			} else {
				Mt.global[k[0]] = j
			}
			this.items.add(g, j)
		},
		get: function(e) {
			return this.items.get(e)
		}
	};
	Mt.ClassManager = new a();
	Mt.Class = function(g, f) {
		var f = f || {},
		j = [];
		if (Mt.isArray(g)) {
			j = g;
			g = j[0]
		}
		if (f.constructor === Object) {
			if (f.extend === undefined) {
				f.constructor = function() {}
			} else {
				f.constructor = function() {
					this.Super("constructor", arguments)
				}
			}
		}
		if (f.extend === undefined) {
			c[g] = f.constructor
		} else {
			c[g] = f.constructor;
			var e;
			switch (typeof f.extend) {
			case "string":
				e = Mt.ClassManager.get(f.extend);
				c[g].prototype.$Super = Mt.ClassManager.get(f.extend);
				break;
			case "function":
				e = f.extend;
				c[g].prototype.$Super = f.extend;
				break
			}
			delete f.extend;
			c[g].prototype.Super = function(m, k) {
				var l = this;
				if (l.$Iam) {
					l.$Iam = Mt.ClassManager.get(l.$Iam.prototype.$Super.prototype.$name)
				} else {
					l.$Iam = Mt.ClassManager.get(l.$Super.prototype.$name)
				}
				switch (m) {
				case "const":
				case "constructor":
					l.$Iam.apply(l, k);
					break;
				default:
					l.$Iam.prototype[m].apply(l, k)
				}
				delete l.$Iam
			};
			d(c[g], e)
		}
		c[g].prototype.$name = g;
		if (f.traits) {
			Mt.trait(c[g].prototype, f.traits);
			delete c[g].prototype.traits
		}
		if (f.plugins !== undefined) {
			if (c[g].prototype.$plugins === undefined) {
				c[g].prototype.$plugins = []
			}
			c[g].prototype.$plugins = c[g].prototype.$plugins.concat(f.plugins);
			delete c[g].prototype.plugins
		}
		for (var i in f) {
			c[g].prototype[i] = f[i]
		}
		var h = c[g];
		if (f.singleton === true) {
			delete c[g];
			h = new h(f);
			c[g] = h
		}
		if (j.length > 1) {
			Mt.each(j,
			function(k) {
				Mt.ClassManager.add(k, h)
			})
		} else {
			Mt.ClassManager.add(g, h)
		}
		if (f.type) {
			b[f.type] = h;
			Mt.addWidgetType(f.type, h)
		} else {
			if (f.ptype) {
				b[f.type] = h;
				Mt.addPluginByType(f.ptype, h)
			}
		}
	};
	Mt.getClassByType = function(e) {
		return b[e]
	}
})();
Mt.TraitClass = function() {};
Mt.TraitClass.prototype = {
	initId: function() {
		var a = this,
		b = a.prefix || Mt.prefix;
		a.id = a.id || Mt.id(null, b);
		Mt.addWidget(a.id, a)
	},
	initPlugins: function() {
		var j = this,
		d = j,
		e, k, f;
		if (j.plugins !== undefined) {
			j.$plugins = j.plugins;
			delete j.plugins
		}
		if (j.$plugins === undefined) {
			return
		}
		var c = 0,
		b = j.$plugins,
		a = b.length,
		h;
		for (; c < a; c++) {
			f = b[c];
			f.widget = d;
			var g = f.type || f.ptype;
			e = Mt.getPluginByType(g);
			k = new e(f);
			h = f.inWidgetName || k.inWidgetName;
			if (h !== undefined) {
				d[h] = k
			}
		}
	}
};
Mt.Class("Mt.Data", {
	constructor: function(d) {
		var c = this;
		c.map = {};
		if (d) {
			var a = 0,
			b = d.length,
			e = c.map;
			for (; a < b; a++) {
				e[a] = d[a]
			}
		}
		c.length = 0
	},
	add: function(a, c) {
		var b = this;
		b.map[a] = c;
		b.length++
	},
	get: function(a) {
		return this.map[a]
	}
});
Mt.Class("Mt.PluginManager", {
	singleton: true,
	constructor: function() {
		var a = this;
		a.ptypes = new Mt.Data()
	},
	addPlugin: function(b, a) {
		this.ptypes.add(b, a)
	},
	getPlugin: function(a) {
		return this.ptypes.get(a)
	}
});
Mt.addPluginByType = function(b, a) {
	Mt.PluginManager.addPlugin(b, a)
};
Mt.getPluginByType = function(a) {
	return Mt.PluginManager.getPlugin(a)
};
Mt.Class("Mt.WidgetManager", {
	singleton: true,
	constructor: function() {
		var a = this;
		a.wtypes = new Mt.Data();
		a.widgets = new Mt.Data()
	},
	addWidgetType: function(a, b) {
		b.prototype.wtype = a;
		this.wtypes.add(a, b)
	},
	getWidgetClassByType: function(a) {
		return this.wtypes.get(a)
	},
	addWidget: function(b, a) {
		this.widgets.add(b, a)
	},
	getWidget: function(a) {
		return this.widgets.get(a)
	}
});
Mt.addWidgetType = function(a, b) {
	Mt.WidgetManager.addWidgetType(a, b)
};
Mt.getWidgetClassByType = function(a) {
	return Mt.WidgetManager.getWidgetClassByType(a)
};
Mt.addWidget = function(b, a) {
	Mt.WidgetManager.addWidget(b, a)
};
Mt.getWidget = function(a) {
	return Mt.WidgetManager.getWidget(a)
}; (function() {
	var b = 0,
	a = {};
	Mt.Class(["Mt.Event", "Mt.Observable"], {
		traits: {
			classes: [Mt.TraitClass]
		},
		constructor: function(e) {
			var j = this,
			e = e || {};
			Mt.applyConfig(j, e);
			j.$events = {};
			if (j.listeners || j.events) {
				var k = j.listeners || j.events,
				g = 0,
				d = k.length;
				for (; g < d; g++) {
					var n = k[g],
					h = null,
					m = null,
					l = null,
					f = [];
					for (var c in n) {
						if (c === "scope") {
							l = n[c]
						} else {
							if (c === "params") {
								f = n[c]
							} else {
								h = c;
								m = n[c]
							}
						}
					}
					if (h === null || Mt.isFunction(m) === false) {
						throw new Error("Event was not set")
					}
					if (Mt.isArray(f) === false) {
						throw new Error("params must be array")
					}
					j.addEvent(h);
					j.on(h, m, l, f)
				}
			}
		},
		on: function(c, e, d, f) {
			if (this.$events[c] === undefined) {
				console.log(arguments);
				throw new Error("Event name is not set: " + c)
			}
			e.$mtFnSeed = b;
			a[b] = e;
			b++;
			this.$events[c].push({
				fn: e,
				scope: d,
				params: f || []
			})
		},
		un: function(d, g) {
			var h = this,
			j = h.$events[d];
			if (!j) {
				return false
			}
			var f = 0,
			c = j.length;
			for (; f < c; f++) {
				var e = j[f];
				if (e.fn.$mtFnSeed === g.$mtFnSeed) {
					e.toRemove = true;
					return true
				}
			}
			return false
		},
		once: function(c, e, d) {
			var g = this,
			f = function() {
				e.apply(this, arguments);
				g.un(c, f)
			};
			g.on(c, f, d)
		},
		unAll: function() {
			this.$events = {}
		},
		unAllByType: function(c) {
			this.$events[c] = []
		},
		fire: function(e) {
			var j = this,
			k = j.$events[e];
			if (!k) {
				return false
			}
			var h = 1,
			d = arguments.length,
			g = [j];
			for (; h < d; h++) {
				g.push(arguments[h])
			}
			var h = 0,
			d = k.length;
			for (; h < d; h++) {
				var f = k[h],
				c = [];
				if (f.toRemove === true) {
					k.splice(h, 1);
					h--;
					d = k.length;
					continue
				}
				c = c.concat(g);
				if (f.params) {
					c = c.concat(f.params)
				}
				f.fn.apply(f.scope || j, c)
			}
		},
		addEvent: function(c) {
			var d = this;
			d.$events[c] = d.$events[c] || []
		},
		addEvents: function(e) {
			var g = this;
			if (arguments.length > 1) {
				var d = [],
				f = 0,
				c = arguments.length;
				for (; f < c; f++) {
					d[f] = arguments[f]
				}
				e = d
			}
			if (Mt.typeOf(e) === "string") {
				g.$events[e] = g.$events[e] || []
			} else {
				if (Mt.typeOf(e) === "array") {
					var f = 0,
					c = e.length;
					for (; f < c; f++) {
						g.$events[e[f]] = g.$events[e[f]] || []
					}
				}
			}
		},
		has: function(c) {
			var d = this.$events[c];
			if (!d) {
				return false
			}
			return d.length !== 0
		}
	})
})();
Mt.$ = $;
Mt.get = function(b) {
	var a = Mt.typeOf(b);
	switch (a) {
	case "string":
		return new Mt.Element(Mt.$("#" + b)[0]);
		break;
	default:
		return new Mt.Element(b);
		break
	}
};
Mt.Element = function(b) {
	var a = this;
	a.dom = b;
	a.$dom = Mt.$(b)
};
Mt.Element.prototype = {
	on: function(a, c, b) {
		var d = this;
		if (b) {
			d.$dom.on(a, $.proxy(c, b))
		} else {
			d.$dom.on(a, c)
		}
	},
	un: function() {},
	getByClass: function(a) {
		var b = this;
		return b.$dom.find("." + a)[0]
	},
	getByTag: function(a) {
		var b = this;
		return Mt.get(b.$dom.find(a)[0])
	},
	addClass: function(a) {
		var b = this;
		b.$dom.addClass(a)
	},
	removeClass: function(a) {
		var b = this;
		b.$dom.removeClass(a)
	},
	hasClass: function(a) {
		var b = this;
		return b.$dom.hasClass(a)
	},
	toggleClass: function(a) {
		var b = this;
		b.$dom.toggleClass(a)
	},
	select: function(a) {
		var b = this;
		return b.$dom.find(a)
	},
	attr: function(b, a) {
		if (a === undefined) {
			return this.$dom.attr(b)
		}
		return this.$dom.attr(b, a)
	},
	css: function(b, a) {
		if (a === undefined) {
			return this.$dom.css(b)
		}
		return this.$dom.css(b, a)
	}
};
Mt.onReady = function(a) {
	$(document).ready(a)
};
Mt.Ajax = function(b) {
	var a = {};
	if (b.url) {
		a.url = b.url
	}
	if (b.success) {
		a.success = b.success
	}
	if (b.error) {
		a.error = b.error
	}
	if (b.method) {
		a.type = b.type
	}
	if (b.params) {
		a.data = b.params
	}
	$.ajax(a)
};
Mt.Class("Mt.Widget", {
	extend: Mt.Event,
	constructor: function(a) {
		var b = this;
		Mt.applyConfig(b, a);
		b.Super("const", arguments);
		b.init()
	},
	init: function() {
		var a = this;
		a.initId();
		a.addEvents("beforerender", "afterrender", "render", "show", "hide", "destroy");
		a.initPlugins()
	},
	renderItems: function(f) {
		var e = this,
		c = 0,
		b = e.items.length;
		for (; c < b; c++) {
			var d = e.items[c],
			a = Mt.getClassByType(d.type);
			d.renderTo = f;
			e.items[c] = new a(d)
		}
	}
});
Mt.Class("Mt.Button", {
	extend: Mt.Widget,
	constructor: function() {
		var a = this;
		a.Super("const", arguments)
	},
	init: function() {
		var a = this;
		a.addEvents("click", "mousedown", "mouseup", "mouseover", "mouseout");
		a.Super("init", arguments);
		a.style = a.style || {};
		a.render();
		a.setOns()
	},
	setOns: function() {
		var b = this,
		a = b.el;
		a.on("click", b.onClick, b);
		a.on("mousedown", b.onMouseDown, b);
		a.on("mouseup", b.onMouseUp, b);
		a.on("mouseover", b.onMouseOver, b);
		a.on("mouseout", b.onMouseOut, b)
	},
	cls: "mt mt-button",
	text: "",
	height: 28,
	paddingTextWidth: 20,
	render: function() {
		var c = this,
		d = Mt.get(c.renderTo || document.body).dom,
		b = document.createElement("div"),
		a = 0;
		c.fire("beforerender");
		if (c.width) {
			a = c.width
		} else {
			a = c.paddingTextWidth * 2;
			a += c.text.length * 7
		}
		b.className = c.cls;
		b.style.width = a + "px";
		b.style.height = c.height + "px";
		b.innerHTML = ['<div class="mt-button-text">', c.text, "</div>"].join("");
		c.el = Mt.get(d.appendChild(b));
		Mt.each(c.style,
		function(e, f) {
			c.el.css(f, e)
		});
		c.fire("afterrender");
		c.fire("render")
	},
	onClick: function() {
		var a = this;
		a.fire("click");
		if (a.handler) {
			a.handler(a)
		}
	},
	onMouseDown: function() {
		var a = this;
		a.fire("mousedown")
	},
	onMouseUp: function() {
		var a = this;
		a.fire("mouseup")
	},
	onMouseOver: function() {
		var a = this;
		a.fire("mouseover")
	},
	onMouseOut: function() {
		var a = this;
		a.fire("mouseout")
	}
});
Mt.Class("Mt.Panel", {
	extend: Mt.Widget,
	constructor: function() {
		var b = this,
		a = a || {};
		Mt.apply(b, a);
		b.Super("constructor", arguments)
	},
	init: function() {
		var a = this;
		a.Super("init", arguments);
		a.render()
	},
	cls: "mt mt-panel",
	value: "",
	width: 300,
	height: 200,
	title: "",
	frame: false,
	shadow: true,
	render: function() {
		var c = this,
		d = Mt.get(c.renderTo || document.body),
		b = document.createElement("div"),
		a = c.cls;
		if (c.shadow) {
			a += " mt-panel-shadow"
		}
		b.className = a;
		b.style.width = c.width + "px";
		b.style.height = c.height + "px";
		b.innerHTML = ['<div class="mt-panel-header">', '<div class="mt-panel-header-text">', c.title, "</div>", "</div>", '<div style="height: ' + (c.height - 34) + "px;width: " + (c.width - 2) + 'px;" class="mt-panel-body ">', "</div>"].join("");
		c.el = d.dom.appendChild(b);
		c.el = Mt.get(c.el)
	}
});
Mt.Class("Mt.Form", {
	extend: Mt.Widget,
	type: "form",
	constructor: function(a) {
		var b = this;
		if (a.title) {
			var c = new Mt.Panel({
				renderTo: a.renderTo,
				title: a.title,
				width: a.width,
				height: a.height,
				buttons: a.buttons
			});
			a.renderTo = c.el.getByClass("mt-panel-body");
			a.isPanel = true
		}
		b.Super("const", arguments)
	},
	init: function() {
		var a = this;
		a.Super("init", arguments);
		if (a.defaults) {
			for (var b in a.defaults) {
				Mt.each(a.items,
				function(c) {
					if (c[b] === undefined) {
						c[b] = a.defaults[b]
					}
				})
			}
		}
		Mt.each(a.items,
		function(c) {
			if (c.labelWidth === undefined) {
				c.labelWidth = a.labelWidth
			}
			if (c.inputWidth === undefined) {
				c.inputWidth = a.inputWidth
			}
			if (c.type === "pass" || c.type === "password") {
				c.type = "string";
				c.isPassword = true
			}
		});
		a.addEvents();
		a.tpl = new Mt.Template(a.tpl);
		a.render();
		a.ons()
	},
	cls: "mt mt-form",
	value: "",
	width: 200,
	emptyText: "",
	labelWidth: 65,
	inputWidth: 100,
	tpl: ['<div class="mt-form-body">', "</div>", '<div class="mt-panel-bbar" style="{isBBar}">', "</div>"],
	render: function() {
		var e = this,
		f = e.renderTo || document.body,
		c = document.createElement("div"),
		a = e.cls,
		d = "display: none;";
		if (e.buttons) {
			d = ""
		}
		e.fire("beforerender");
		if (e.isPanel === true) {
			Mt.get(c).css("border-width", "0px");
			e.width -= 2;
			e.height -= 34
		}
		c.className = e.cls;
		c.style.width = e.width + "px";
		c.style.height = e.height + "px";
		c.innerHTML = e.tpl.getHTML({
			isBBar: d
		});
		e.el = Mt.get(f.appendChild(c));
		e.renderItems(e.el.getByClass("mt-form-body"));
		if (e.buttons) {
			var b = e.buttons.length;
			while (b--) {
				e.buttons[b].renderTo = e.el.getByClass("mt-panel-bbar");
				e.buttons[b] = new Mt.Button(e.buttons[b])
			}
		}
		e.fire("afterrender");
		e.fire("render")
	},
	renderItems: function(f) {
		var e = this,
		c = 0,
		b = e.items.length;
		for (; c < b; c++) {
			var d = e.items[c],
			a;
			switch (d.type) {
			case "string":
				a = Mt.form.field.String;
				break;
			case "number":
				a = Mt.form.field.Number;
				break;
			case "textarea":
				a = Mt.form.field.TextArea;
				break;
			case "checkbox":
				a = Mt.form.field.CheckBox;
				break;
			case "combo":
				a = Mt.form.field.Combo;
				break;
			default:
				throw new Error("type " + d.type + " is not set")
			}
			d.renderTo = f;
			e.items[c] = new a(d)
		}
	},
	ons: function() {
		var a = this;
		Mt.each(a.items,
		function(b) {
			b.on("key",
			function() {
				a.fire("key", b.name, b.get())
			})
		})
	},
	get: function(b) {
		var c = this;
		if (b) {
			var d;
			Mt.each(c.items,
			function(e) {
				if (e.name === b) {
					d = e.get();
					return true
				}
			});
			return d
		} else {
			var a = {};
			Mt.each(c.items,
			function(e) {
				a[e.name] = e.get()
			});
			return a
		}
	},
	clear: function(a) {
		var b = this;
		Mt.each(b.items,
		function(d) {
			if (a !== false) {
				d.clear()
			}
			var c = d.el;
			if (c.hasClass("mt-field-not-valid")) {
				c.removeClass("mt-field-not-valid");
				c.css("height", (parseInt(c.css("height")) - 6) + "px")
			}
			if (c.hasClass("mt-field-blank-err")) {
				c.removeClass("mt-field-blank-err");
				c.css("height", (parseInt(c.css("height")) - 6) + "px")
			}
		})
	},
	submit: function(d) {
		var b = this,
		c = b.params || {};
		b.params = b.params || {};
		Mt.apply(b, d);
		if (d.params) {
			Mt.apply(c, b.params);
			b.params = c
		}
		b.clear(false);
		if (b.valid() === false) {
			return
		}
		var a = b.get();
		Mt.applyIf(b.params, a);
		Mt.Ajax(b)
	},
	valid: function() {
		var b = this,
		a = true;
		Mt.each(b.items,
		function(c) {
			if (a === true) {
				a = c.onBlur()
			} else {
				c.onBlur()
			}
		});
		return a
	}
});
var FancyForm = Mt.Form;
FancyForm.vtype = function(a) {
	Mt.form.field.Trait.prototype.vtypes[a.type] = a
};
Mt.$.fn.FancyForm = function(a) {
	a.renderTo = $(this.selector)[0];
	return new Mt.Form(a)
};
Mt.ns("Mt.form.field");
Mt.form.field.Trait = function() {};
Mt.form.field.Trait.prototype = {
	vtypes: {},
	ons: function() {
		var b = this,
		a = b.el.getByTag("input");
		b.input = a;
		a.on("blur", b.onBlur, b);
		a.on("focus", b.onFocus, b);
		a.on("input", b.onInput, b);
		a.on("keydown", b.onKeyDown, b);
		b.on("key", b.onKey, b)
	},
	prepareValid: function() {
		var c = this,
		b = c.valid,
		d = c.vtypes;
		if (b && b.type) {
			var a = d[b.type];
			if (!a) {
				throw new Error("not right validation type - " + b.type)
			}
			Mt.applyIf(c.valid, a)
		}
	},
	render: function() {
		var c = this,
		e = c.renderTo || document.body,
		b = document.createElement("div");
		c.prepareValid();
		c.fire("beforerender");
		b.className = c.cls;
		var a = "",
		d = "";
		if (c.labelWidth) {
			a = "width:" + c.labelWidth + "px;"
		}
		if (c.inputWidth) {
			d = "width:" + c.inputWidth + "px;"
		}
		b.innerHTML = c.tpl.getHTML({
			labelWidth: a,
			label: c.label,
			emptyText: c.emptyText,
			inputWidth: d,
			value: c.value,
			height: c.height,
			errorTextStyle: "margin-left: " + (c.labelWidth + 11) + "px;"
		});
		c.el = e.appendChild(b);
		c.el = Mt.get(c.el);
		c.acceptedValue = c.value;
		c.fire("afterrender");
		c.fire("render");
		setTimeout(function() {
			if (c.input) {
				if (c.input.dom.value.length === 0) {
					if (c.prevColor === undefined) {
						c.prevColor = c.input.css("color")
					}
					c.input.css("color", "grey")
				}
			}
		})
	},
	onKeyDown: function(f) {
		var b = this,
		d = f.keyCode,
		a = Mt.key;
		if (b.type === "number") {
			if (Mt.Key.isNumControl(d, f) === false) {
				f.preventDefault();
				f.stopPropagation();
				return
			}
		}
		switch (d) {
		case a.ENTER:
			if (b.type !== "textarea") {
				b.fire("enter", b.getValue());
				f.preventDefault();
				f.stopPropagation()
			}
			break;
		case a.UP:
			if (b.type === "number") {
				var c = +b.get() + b.step;
				if (isNaN(c)) {
					c = b.min || 0
				}
				if (b.max !== undefined && c > b.max) {
					c = b.max
				} else {
					if (c < b.min) {
						c = b.min
					}
				}
				b.set(c)
			}
			b.fire("up", b.getValue());
			f.preventDefault();
			f.stopPropagation();
			break;
		case a.DOWN:
			if (b.type === "number") {
				var c = +b.get() - b.step;
				if (isNaN(c)) {
					c = b.min || 0
				}
				if (b.min !== undefined && c < b.min) {
					c = b.min
				} else {
					if (c > b.max) {
						c = b.max
					}
				}
				b.set(c)
			}
			b.fire("up", b.getValue());
			f.preventDefault();
			f.stopPropagation();
			break;
		case a.LEFT:
			break;
		case a.RIGHT:
			f.stopPropagation();
			break;
		default:
			setTimeout(function() {
				if (b.input) {
					if (b.input.dom.value.length === 0) {
						if (b.prevColor === undefined) {
							b.prevColor = b.input.css("color")
						}
						b.input.css("color", "grey")
					} else {
						if (b.prevColor) {
							b.input.css("color", b.prevColor)
						} else {
							b.input.css("color", " ")
						}
					}
				}
			})
		}
		setTimeout(function() {
			b.fire("key", b.getValue())
		})
	},
	onKey: function() {
		var b = this,
		a = b.valid;
		if (a && a.type) {
			b.validate()
		}
	},
	onBlur: function() {
		var c = this,
		a = c.el,
		b = c.valid,
		d = true;
		if (b) {
			if (b.blank === false && c.get().length === 0) {
				a.addClass("mt-field-blank-err");
				if (a.hasClass("mt-field-not-valid")) {
					a.removeClass("mt-field-not-valid");
					a.css("height", (parseInt(a.css("height")) - 6) + "px")
				}
				if (b.blankText) {
					a.css("height", (parseInt(a.css("height")) + 6) + "px");
					a.select(".mt-field-error")[0].innerHTML = b.blankText
				}
			} else {
				if (b.type) {
					c.validate()
				}
			}
		}
		if (a.hasClass("mt-field-blank-err")) {
			d = false
		}
		if (a.hasClass("mt-field-not-valid")) {
			d = false
		}
		c.fire("blur");
		return d
	},
	onFocus: function() {
		var b = this,
		a = b.el;
		if (a.hasClass("mt-field-blank-err")) {
			b.el.removeClass("mt-field-blank-err");
			if (b.valid.blankText) {
				a.css("height", (parseInt(a.css("height")) - 6) + "px")
			}
		}
		b.fire("focus")
	},
	onInput: function(f, d) {
		var b = this,
		a = b.input,
		c = b.getValue();
		b.acceptedValue = b.get();
		b.fire("input", c);
		b.fire("change", c)
	},
	get: function() {
		var a = this;
		return a.input.dom.value
	},
	getValue: function() {
		return this.get()
	},
	set: function(c, a) {
		var b = this;
		b.input.dom.value = c;
		if (a !== false) {
			b.onInput()
		}
	},
	setValue: function(b, a) {
		this.set(b, a)
	},
	clear: function() {
		this.set("")
	},
	validate: function() {
		var f = this,
		d = f.el,
		e = f.valid,
		h = f.vtypes,
		c = h[e.type];
		if (!c) {
			throw new Error("not right validation type - " + e.type)
		}
		var g = f.get(),
		a = d.hasClass("mt-field-not-valid");
		if (c.fn) {
			if (!c.fn(g)) {
				d.addClass("mt-field-not-valid")
			} else {
				d.removeClass("mt-field-not-valid")
			}
		} else {
			if (c.re) {
				if (!c.re.test(g)) {
					d.addClass("mt-field-not-valid")
				} else {
					d.removeClass("mt-field-not-valid")
				}
			}
		}
		var b = d.hasClass("mt-field-not-valid");
		if (a === false && b === true) {
			if (e.text) {
				d.css("height", (parseInt(d.css("height")) + 6) + "px")
			}
		}
		if (a === true && b === false) {
			if (e.text) {
				d.css("height", (parseInt(d.css("height")) - 6) + "px")
			}
		}
		if (b) {
			d.select(".mt-field-error")[0].innerHTML = e.text
		}
		return b
	}
};
FancyForm.vtype({
	type: "email",
	re: /^(")?(?:[^\."])(?:(?:[\.])?(?:[\w\-!#$%&'*+\/=?\^_`{|}~]))*\1@(\w[\-\w]*\.){1,5}([A-Za-z]){2,6}$/,
	text: "Incorect email"
});
Mt.Class("Mt.form.field.String", {
	traits: {
		classes: [Mt.form.field.Trait]
	},
	extend: Mt.Widget,
	type: "field.string",
	constructor: function(a) {
		var b = this,
		a = a || {};
		Mt.apply(b, a);
		b.Super("const", arguments)
	},
	init: function() {
		var a = this;
		a.addEvents("focus", "blur", "input", "enter", "up", "down", "change", "key");
		a.Super("init", arguments);
		a.tpl = new Mt.Template(a.tpl);
		a.render();
		a.ons();
		if (a.isPassword) {
			a.input.attr({
				type: "password"
			})
		}
	},
	cls: "mt mt-field",
	value: "",
	width: 100,
	emptyText: "",
	tpl: ['<div class="mt-field-label" style="{labelWidth}">', "{label}:", "</div>", '<div class="mt-field-text">', '<input placeholder="{emptyText}" class="mt-field-text-input" style="{inputWidth}" value="{value}">', '<div class="mt-field-error" style="{errorTextStyle}"></div>', "</div>"]
});
Mt.Class("Mt.form.field.Number", {
	traits: {
		classes: [Mt.form.field.Trait]
	},
	extend: Mt.Widget,
	type: "field.number",
	allowBlank: true,
	constructor: function(a) {
		var b = this,
		a = a || {};
		Mt.apply(b, a);
		b.Super("const", arguments)
	},
	init: function() {
		var a = this;
		a.addEvents("focus", "blur", "input", "enter", "up", "down", "change", "key");
		a.Super("init", arguments);
		a.tpl = new Mt.Template(a.tpl);
		a.render();
		a.ons()
	},
	cls: "mt mt-field",
	value: "",
	width: 100,
	emptyText: "",
	step: 1,
	max: 100000000000000000000,
	min: -100000000000000000000,
	tpl: ['<div class="mt-field-label" style="{labelWidth}">', "{label}:", "</div>", '<div class="mt-field-text">', '<input placeholder="{emptyText}" class="mt-field-text-input" style="{inputWidth}" value="{value}">', '<div class="mt-field-error" style="{errorTextStyle}"></div>', "</div>"],
	onInput: function(g, f) {
		var b = this,
		a = b.input,
		c = b.get(),
		d = b.checkMinMax(c);
		if (b.isNumber(c) === false || c === "-" || c === "+") {
			d = false
		}
		if (d === false) {}
		if (c === "" && b.allowBlank) {
			d = true
		} else {
			if (c === "" && b.allowBlank === false) {
				d = false;
				b.el.addClass("mt-field-not-valid")
			}
		}
		if (c === "" || c === "-") {} else {}
		if (d) {
			b.acceptedValue = b.get();
			b.el.removeClass("mt-field-not-valid")
		}
		b.fire("input", c);
		b.fire("change", c)
	},
	isNumber: function(b) {
		var a = this;
		if (b === "" || b === "-") {
			return true
		}
		return Mt.isNumber( + b)
	},
	checkMinMax: function(b) {
		if (b === "" || b === "-") {
			return true
		}
		var a = this,
		b = +b;
		return b >= a.min && b <= a.max
	}
});
Mt.Class("Mt.form.field.TextArea", {
	traits: {
		classes: [Mt.form.field.Trait]
	},
	extend: Mt.Widget,
	type: "field.textarea",
	constructor: function() {
		var a = this;
		a.Super("const", arguments)
	},
	init: function() {
		var a = this;
		a.addEvents("focus", "blur", "input", "up", "down", "change", "key");
		a.Super("init", arguments);
		a.tpl = new Mt.Template(a.tpl);
		a.render();
		a.ons()
	},
	cls: "mt mt-field mt-textarea",
	value: "",
	width: 250,
	height: 100,
	labelWidth: 60,
	inputWidth: 180,
	emptyText: "",
	tpl: ['<div class="mt-field-label" style="{labelWidth}">', "{label}:", "</div>", '<div class="mt-textarea-text">', '<textarea autocomplete="off" placeholder="{emptyText}" type="text" class="mt-textarea-text-input" style="{inputWidth}height:{height}px;" value="{value}"></textarea>', "</div>"],
	ons: function() {
		var b = this,
		a = b.el.getByTag("textarea");
		b.input = a;
		a.on("blur", b.onBlur, b);
		a.on("focus", b.onFocus, b);
		a.on("input", b.onInput, b);
		a.on("keydown", b.onKeyDown, b)
	}
});
Mt.Class("Mt.form.field.CheckBox", {
	traits: {
		classes: [Mt.form.field.Trait]
	},
	extend: Mt.Widget,
	type: "field.checkbox",
	constructor: function() {
		var a = this;
		a.Super("const", arguments)
	},
	init: function() {
		var a = this;
		a.addEvents("focus", "blur", "input", "up", "down", "change", "key");
		a.Super("init", arguments);
		a.tpl = new Mt.Template(a.tpl);
		a.render({
			labelWidth: a.labelWidth,
			labelDispay: a.labelText ? "": "none",
			label: a.label
		});
		a.acceptedValue = a.value;
		a.set(a.value);
		a.ons()
	},
	labelText: "",
	labelWidth: 60,
	value: false,
	checkedCls: "mt-checkbox-on",
	cls: "mt mt-field mt-field-checkbox",
	tpl: ['<div class="mt-field-label" style="{labelWidth}">', "{label}:", "</div>", '<div class="mt-field-text">', '<div class="mt-field-checkbox-input" style=""></div>', "</div>"],
	ons: function() {
		var b = this,
		a = b.el;
		a.on("click", b.onClick, b);
		a.on("mousedown", b.onMouseDown, b)
	},
	onClick: function() {
		var b = this,
		a = b.el,
		c = b.checkedCls;
		a.toggleClass(c);
		b.value = a.hasClass(c);
		b.fire("change", b.value)
	},
	onMouseDown: function(d, c) {
		var b = this,
		a = b.el;
		d.preventDefault()
	},
	set: function(d, b) {
		var c = this,
		a = c.el,
		e = c.checkedCls;
		if (d === true || d === 1) {
			a.addClass(e);
			d = true
		} else {
			if (d === false || d === 0) {
				a.removeClass(e);
				d = false
			} else {
				throw new Error("not right value for checkbox " + d)
			}
		}
		c.value = d;
		if (b !== false) {
			c.fire("change", c.value)
		}
	},
	setValue: function(b, a) {
		this.set(b, a)
	},
	getValue: function() {
		var a = this;
		return a.value
	},
	get: function() {
		return this.getValue()
	},
	clear: function() {
		this.set(false)
	}
});
Mt.Class("Mt.form.field.Combo", {
	traits: {
		classes: [Mt.form.field.Trait]
	},
	extend: Mt.Widget,
	type: "field.combo",
	constructor: function() {
		var a = this;
		a.Super("const", arguments)
	},
	init: function() {
		var a = this;
		a.addEvents("focus", "blur", "input", "up", "down", "change", "key");
		a.Super("init", arguments);
		a.tpl = new Mt.Template(a.tpl);
		a.render();
		a.ons()
	},
	cls: "mt mt-field mt-combo",
	width: 250,
	height: 100,
	labelWidth: 60,
	inputWidth: 180,
	emptyText: "",
	tpl: ['<div class="mt-field-label" style="{labelWidth}">', "{label}:", "</div>", '<div class="mt-combo-text">', '<table cellspacing="0" cellpadding="0">', "<tbody>", "<tr>", '<td class="">', '<input value="{value}" type="text" class="mt-combo-input" readonly="true" style="{inputWidth} ">', "</td>", '<td class="mt-combo-dropdown-button" style="width: 20px; ">&nbsp;</td>', "</tr>", "</tbody>", "</table>", "{listHTML}", "</div>"],
	ons: function() {
		var d = this,
		c = d.el.getByTag("table"),
		a = d.el.getByTag("input"),
		f = d.listEl;
		d.input = a;
		var b = f.select("li"),
		e;
		b.hover(function(g) {
			if (e) {
				e.removeClass("mt-combo-list-active")
			}
			Mt.get(g.target).addClass("mt-combo-list-active");
			e = Mt.get(g.target)
		});
		b.on("click",
		function(i) {
			var g = Mt.get(i.target),
			h = Number(g.attr("value"));
			if (d.displayKey) {
				h = d.data[h][d.displayKey]
			}
			a.dom.value = h;
			d.set(Number(g.attr("value")));
			f.css("display", "none")
		});
		c.on("mousedown",
		function(g) {
			g.preventDefault()
		});
		c.on("click",
		function(h) {
			var g = Mt.get(h.target);
			if (f.css("display") === "none") {
				f.css("display", "")
			} else {
				f.css("display", "none")
			}
		})
	},
	render: function() {
		var d = this,
		h = d.renderTo || document.body,
		c = document.createElement("div"),
		f = document.createElement("div"),
		e = d.value;
		if (e === undefined) {
			e = ""
		} else {
			e = d.data[e][d.displayKey]
		}
		d.fire("beforerender");
		c.className = d.cls;
		var a = "",
		g = "";
		if (d.labelWidth) {
			a = "width:" + d.labelWidth + "px;"
		}
		if (d.inputWidth) {
			g = "width:" + (d.inputWidth - 20) + "px;"
		}
		var b = ['<div class="mt-combo-result-list" style="display: none;left: ' + (d.labelWidth + 8 + 10) + "px;width: " + (d.inputWidth + 14) + 'px;">', '<ul style="position: relative;">'];
		Mt.each(d.data,
		function(l, j) {
			var k = "";
			if (j === 0) {
				k = "mt-combo-list-active"
			}
			b.push('<li value="' + l.index + '" class="' + k + '">' + l[d.displayKey] + "</li>")
		});
		b.push("</ul>");
		b.push("</div>");
		c.innerHTML = d.tpl.getHTML({
			listHTML: b.join(""),
			labelWidth: a,
			label: d.label,
			emptyText: d.emptyText,
			inputWidth: g,
			value: e,
			height: d.height
		});
		d.el = h.appendChild(c);
		d.el = Mt.get(d.el);
		d.listEl = Mt.get(d.el.getByClass("mt-combo-result-list"));
		d.acceptedValue = d.value;
		d.fire("afterrender");
		d.fire("render")
	},
	getValue: function() {
		var a = this;
		if (a.valueKey) {
			return a.data[a.value][a.valueKey]
		}
		return a.value
	},
	get: function() {
		return this.getValue()
	},
	set: function(c, a) {
		var b = this;
		b.value = c;
		b.input.dom.value = b.data[b.value][b.displayKey];
		if (a !== false) {
			b.onInput()
		}
	},
	setValue: function(b, a) {
		this.set(b, a)
	},
	onInput: function(d, c) {
		var a = this,
		b = a.getValue();
		a.acceptedValue = a.get();
		a.fire("change", b)
	},
	clear: function() {
		var a = this;
		a.set(0, true)
	}
});