/**
 * @fileoverview
 * @enhanceable
 * @public
 */
// GENERATED CODE -- DO NOT EDIT!

var jspb = require('google-protobuf');
var goog = jspb;
var global = Function('return this')();

goog.exportSymbol('proto.stdlib.Bar', null, global);
goog.exportSymbol('proto.stdlib.Foo', null, global);

/**
 * Generated by JsPbCodeGenerator.
 * @param {Array=} opt_data Optional initial data array, typically from a
 * server response, or constructed directly in Javascript. The array is used
 * in place and becomes part of the constructed object. It is not cloned.
 * If no data is provided, the constructed object will be empty, but still
 * valid.
 * @extends {jspb.Message}
 * @constructor
 */
proto.stdlib.Foo = function(opt_data) {
  jspb.Message.initialize(this, opt_data, 0, -1, null, null);
};
goog.inherits(proto.stdlib.Foo, jspb.Message);
if (goog.DEBUG && !COMPILED) {
  proto.stdlib.Foo.displayName = 'proto.stdlib.Foo';
}


if (jspb.Message.GENERATE_TO_OBJECT) {
/**
 * Creates an object representation of this proto suitable for use in Soy templates.
 * Field names that are reserved in JavaScript and will be renamed to pb_name.
 * To access a reserved field use, foo.pb_<name>, eg, foo.pb_default.
 * For the list of reserved names please see:
 *     com.google.apps.jspb.JsClassTemplate.JS_RESERVED_WORDS.
 * @param {boolean=} opt_includeInstance Whether to include the JSPB instance
 *     for transitional soy proto support: http://goto/soy-param-migration
 * @return {!Object}
 */
proto.stdlib.Foo.prototype.toObject = function(opt_includeInstance) {
  return proto.stdlib.Foo.toObject(opt_includeInstance, this);
};


/**
 * Static version of the {@see toObject} method.
 * @param {boolean|undefined} includeInstance Whether to include the JSPB
 *     instance for transitional soy proto support:
 *     http://goto/soy-param-migration
 * @param {!proto.stdlib.Foo} msg The msg instance to transform.
 * @return {!Object}
 */
proto.stdlib.Foo.toObject = function(includeInstance, msg) {
  var f, obj = {
    message: msg.getMessage()
  };

  if (includeInstance) {
    obj.$jspbMessageInstance = msg;
  }
  return obj;
};
}


/**
 * Deserializes binary data (in protobuf wire format).
 * @param {jspb.ByteSource} bytes The bytes to deserialize.
 * @return {!proto.stdlib.Foo}
 */
proto.stdlib.Foo.deserializeBinary = function(bytes) {
  var reader = new jspb.BinaryReader(bytes);
  var msg = new proto.stdlib.Foo;
  return proto.stdlib.Foo.deserializeBinaryFromReader(msg, reader);
};


/**
 * Deserializes binary data (in protobuf wire format) from the
 * given reader into the given message object.
 * @param {!proto.stdlib.Foo} msg The message object to deserialize into.
 * @param {!jspb.BinaryReader} reader The BinaryReader to use.
 * @return {!proto.stdlib.Foo}
 */
proto.stdlib.Foo.deserializeBinaryFromReader = function(msg, reader) {
  while (reader.nextField()) {
    if (reader.isEndGroup()) {
      break;
    }
    var field = reader.getFieldNumber();
    switch (field) {
    case 1:
      var value = /** @type {string} */ (reader.readString());
      msg.setMessage(value);
      break;
    default:
      reader.skipField();
      break;
    }
  }
  return msg;
};


/**
 * Class method variant: serializes the given message to binary data
 * (in protobuf wire format), writing to the given BinaryWriter.
 * @param {!proto.stdlib.Foo} message
 * @param {!jspb.BinaryWriter} writer
 */
proto.stdlib.Foo.serializeBinaryToWriter = function(message, writer) {
  message.serializeBinaryToWriter(writer);
};


/**
 * Serializes the message to binary data (in protobuf wire format).
 * @return {!Uint8Array}
 */
proto.stdlib.Foo.prototype.serializeBinary = function() {
  var writer = new jspb.BinaryWriter();
  this.serializeBinaryToWriter(writer);
  return writer.getResultBuffer();
};


/**
 * Serializes the message to binary data (in protobuf wire format),
 * writing to the given BinaryWriter.
 * @param {!jspb.BinaryWriter} writer
 */
proto.stdlib.Foo.prototype.serializeBinaryToWriter = function (writer) {
  var f = undefined;
  f = this.getMessage();
  if (f.length > 0) {
    writer.writeString(
      1,
      f
    );
  }
};


/**
 * Creates a deep clone of this proto. No data is shared with the original.
 * @return {!proto.stdlib.Foo} The clone.
 */
proto.stdlib.Foo.prototype.cloneMessage = function() {
  return /** @type {!proto.stdlib.Foo} */ (jspb.Message.cloneMessage(this));
};


/**
 * optional string message = 1;
 * @return {string}
 */
proto.stdlib.Foo.prototype.getMessage = function() {
  return /** @type {string} */ (jspb.Message.getFieldProto3(this, 1, ""));
};


/** @param {string} value  */
proto.stdlib.Foo.prototype.setMessage = function(value) {
  jspb.Message.setField(this, 1, value);
};



/**
 * Generated by JsPbCodeGenerator.
 * @param {Array=} opt_data Optional initial data array, typically from a
 * server response, or constructed directly in Javascript. The array is used
 * in place and becomes part of the constructed object. It is not cloned.
 * If no data is provided, the constructed object will be empty, but still
 * valid.
 * @extends {jspb.Message}
 * @constructor
 */
proto.stdlib.Bar = function(opt_data) {
  jspb.Message.initialize(this, opt_data, 0, -1, null, null);
};
goog.inherits(proto.stdlib.Bar, jspb.Message);
if (goog.DEBUG && !COMPILED) {
  proto.stdlib.Bar.displayName = 'proto.stdlib.Bar';
}


if (jspb.Message.GENERATE_TO_OBJECT) {
/**
 * Creates an object representation of this proto suitable for use in Soy templates.
 * Field names that are reserved in JavaScript and will be renamed to pb_name.
 * To access a reserved field use, foo.pb_<name>, eg, foo.pb_default.
 * For the list of reserved names please see:
 *     com.google.apps.jspb.JsClassTemplate.JS_RESERVED_WORDS.
 * @param {boolean=} opt_includeInstance Whether to include the JSPB instance
 *     for transitional soy proto support: http://goto/soy-param-migration
 * @return {!Object}
 */
proto.stdlib.Bar.prototype.toObject = function(opt_includeInstance) {
  return proto.stdlib.Bar.toObject(opt_includeInstance, this);
};


/**
 * Static version of the {@see toObject} method.
 * @param {boolean|undefined} includeInstance Whether to include the JSPB
 *     instance for transitional soy proto support:
 *     http://goto/soy-param-migration
 * @param {!proto.stdlib.Bar} msg The msg instance to transform.
 * @return {!Object}
 */
proto.stdlib.Bar.toObject = function(includeInstance, msg) {
  var f, obj = {
    code: msg.getCode(),
    message: msg.getMessage()
  };

  if (includeInstance) {
    obj.$jspbMessageInstance = msg;
  }
  return obj;
};
}


/**
 * Deserializes binary data (in protobuf wire format).
 * @param {jspb.ByteSource} bytes The bytes to deserialize.
 * @return {!proto.stdlib.Bar}
 */
proto.stdlib.Bar.deserializeBinary = function(bytes) {
  var reader = new jspb.BinaryReader(bytes);
  var msg = new proto.stdlib.Bar;
  return proto.stdlib.Bar.deserializeBinaryFromReader(msg, reader);
};


/**
 * Deserializes binary data (in protobuf wire format) from the
 * given reader into the given message object.
 * @param {!proto.stdlib.Bar} msg The message object to deserialize into.
 * @param {!jspb.BinaryReader} reader The BinaryReader to use.
 * @return {!proto.stdlib.Bar}
 */
proto.stdlib.Bar.deserializeBinaryFromReader = function(msg, reader) {
  while (reader.nextField()) {
    if (reader.isEndGroup()) {
      break;
    }
    var field = reader.getFieldNumber();
    switch (field) {
    case 1:
      var value = /** @type {number} */ (reader.readInt32());
      msg.setCode(value);
      break;
    case 2:
      var value = /** @type {string} */ (reader.readString());
      msg.setMessage(value);
      break;
    default:
      reader.skipField();
      break;
    }
  }
  return msg;
};


/**
 * Class method variant: serializes the given message to binary data
 * (in protobuf wire format), writing to the given BinaryWriter.
 * @param {!proto.stdlib.Bar} message
 * @param {!jspb.BinaryWriter} writer
 */
proto.stdlib.Bar.serializeBinaryToWriter = function(message, writer) {
  message.serializeBinaryToWriter(writer);
};


/**
 * Serializes the message to binary data (in protobuf wire format).
 * @return {!Uint8Array}
 */
proto.stdlib.Bar.prototype.serializeBinary = function() {
  var writer = new jspb.BinaryWriter();
  this.serializeBinaryToWriter(writer);
  return writer.getResultBuffer();
};


/**
 * Serializes the message to binary data (in protobuf wire format),
 * writing to the given BinaryWriter.
 * @param {!jspb.BinaryWriter} writer
 */
proto.stdlib.Bar.prototype.serializeBinaryToWriter = function (writer) {
  var f = undefined;
  f = this.getCode();
  if (f !== 0) {
    writer.writeInt32(
      1,
      f
    );
  }
  f = this.getMessage();
  if (f.length > 0) {
    writer.writeString(
      2,
      f
    );
  }
};


/**
 * Creates a deep clone of this proto. No data is shared with the original.
 * @return {!proto.stdlib.Bar} The clone.
 */
proto.stdlib.Bar.prototype.cloneMessage = function() {
  return /** @type {!proto.stdlib.Bar} */ (jspb.Message.cloneMessage(this));
};


/**
 * optional int32 code = 1;
 * @return {number}
 */
proto.stdlib.Bar.prototype.getCode = function() {
  return /** @type {number} */ (jspb.Message.getFieldProto3(this, 1, 0));
};


/** @param {number} value  */
proto.stdlib.Bar.prototype.setCode = function(value) {
  jspb.Message.setField(this, 1, value);
};


/**
 * optional string message = 2;
 * @return {string}
 */
proto.stdlib.Bar.prototype.getMessage = function() {
  return /** @type {string} */ (jspb.Message.getFieldProto3(this, 2, ""));
};


/** @param {string} value  */
proto.stdlib.Bar.prototype.setMessage = function(value) {
  jspb.Message.setField(this, 2, value);
};


goog.object.extend(exports, proto.stdlib);
