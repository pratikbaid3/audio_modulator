// Autogenerated from Pigeon (v22.7.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#undef _HAS_EXCEPTIONS

#include "messages.g.h"

#include <flutter/basic_message_channel.h>
#include <flutter/binary_messenger.h>
#include <flutter/encodable_value.h>
#include <flutter/standard_message_codec.h>

#include <map>
#include <optional>
#include <string>

namespace pigeon_example {
using flutter::BasicMessageChannel;
using flutter::CustomEncodableValue;
using flutter::EncodableList;
using flutter::EncodableMap;
using flutter::EncodableValue;

FlutterError CreateConnectionError(const std::string channel_name) {
  return FlutterError(
      "channel-error",
      "Unable to establish connection on channel: '" + channel_name + "'.",
      EncodableValue(""));
}

// MessageData

MessageData::MessageData(
  const Code& code,
  const EncodableMap& data)
 : code_(code),
    data_(data) {}

MessageData::MessageData(
  const std::string* name,
  const std::string* description,
  const Code& code,
  const EncodableMap& data)
 : name_(name ? std::optional<std::string>(*name) : std::nullopt),
    description_(description ? std::optional<std::string>(*description) : std::nullopt),
    code_(code),
    data_(data) {}

const std::string* MessageData::name() const {
  return name_ ? &(*name_) : nullptr;
}

void MessageData::set_name(const std::string_view* value_arg) {
  name_ = value_arg ? std::optional<std::string>(*value_arg) : std::nullopt;
}

void MessageData::set_name(std::string_view value_arg) {
  name_ = value_arg;
}


const std::string* MessageData::description() const {
  return description_ ? &(*description_) : nullptr;
}

void MessageData::set_description(const std::string_view* value_arg) {
  description_ = value_arg ? std::optional<std::string>(*value_arg) : std::nullopt;
}

void MessageData::set_description(std::string_view value_arg) {
  description_ = value_arg;
}


const Code& MessageData::code() const {
  return code_;
}

void MessageData::set_code(const Code& value_arg) {
  code_ = value_arg;
}


const EncodableMap& MessageData::data() const {
  return data_;
}

void MessageData::set_data(const EncodableMap& value_arg) {
  data_ = value_arg;
}


EncodableList MessageData::ToEncodableList() const {
  EncodableList list;
  list.reserve(4);
  list.push_back(name_ ? EncodableValue(*name_) : EncodableValue());
  list.push_back(description_ ? EncodableValue(*description_) : EncodableValue());
  list.push_back(CustomEncodableValue(code_));
  list.push_back(EncodableValue(data_));
  return list;
}

MessageData MessageData::FromEncodableList(const EncodableList& list) {
  MessageData decoded(
    std::any_cast<const Code&>(std::get<CustomEncodableValue>(list[2])),
    std::get<EncodableMap>(list[3]));
  auto& encodable_name = list[0];
  if (!encodable_name.IsNull()) {
    decoded.set_name(std::get<std::string>(encodable_name));
  }
  auto& encodable_description = list[1];
  if (!encodable_description.IsNull()) {
    decoded.set_description(std::get<std::string>(encodable_description));
  }
  return decoded;
}


PigeonInternalCodecSerializer::PigeonInternalCodecSerializer() {}

EncodableValue PigeonInternalCodecSerializer::ReadValueOfType(
  uint8_t type,
  flutter::ByteStreamReader* stream) const {
  switch (type) {
    case 129: {
        const auto& encodable_enum_arg = ReadValue(stream);
        const int64_t enum_arg_value = encodable_enum_arg.IsNull() ? 0 : encodable_enum_arg.LongValue();
        return encodable_enum_arg.IsNull() ? EncodableValue() : CustomEncodableValue(static_cast<Code>(enum_arg_value));
      }
    case 130: {
        return CustomEncodableValue(MessageData::FromEncodableList(std::get<EncodableList>(ReadValue(stream))));
      }
    default:
      return flutter::StandardCodecSerializer::ReadValueOfType(type, stream);
    }
}

void PigeonInternalCodecSerializer::WriteValue(
  const EncodableValue& value,
  flutter::ByteStreamWriter* stream) const {
  if (const CustomEncodableValue* custom_value = std::get_if<CustomEncodableValue>(&value)) {
    if (custom_value->type() == typeid(Code)) {
      stream->WriteByte(129);
      WriteValue(EncodableValue(static_cast<int>(std::any_cast<Code>(*custom_value))), stream);
      return;
    }
    if (custom_value->type() == typeid(MessageData)) {
      stream->WriteByte(130);
      WriteValue(EncodableValue(std::any_cast<MessageData>(*custom_value).ToEncodableList()), stream);
      return;
    }
  }
  flutter::StandardCodecSerializer::WriteValue(value, stream);
}

/// The codec used by ExampleHostApi.
const flutter::StandardMessageCodec& ExampleHostApi::GetCodec() {
  return flutter::StandardMessageCodec::GetInstance(&PigeonInternalCodecSerializer::GetInstance());
}

// Sets up an instance of `ExampleHostApi` to handle messages through the `binary_messenger`.
void ExampleHostApi::SetUp(
  flutter::BinaryMessenger* binary_messenger,
  ExampleHostApi* api) {
  ExampleHostApi::SetUp(binary_messenger, api, "");
}

void ExampleHostApi::SetUp(
  flutter::BinaryMessenger* binary_messenger,
  ExampleHostApi* api,
  const std::string& message_channel_suffix) {
  const std::string prepended_suffix = message_channel_suffix.length() > 0 ? std::string(".") + message_channel_suffix : "";
  {
    BasicMessageChannel<> channel(binary_messenger, "dev.flutter.pigeon.audio_modulator.ExampleHostApi.playAudio" + prepended_suffix, &GetCodec());
    if (api != nullptr) {
      channel.SetMessageHandler([api](const EncodableValue& message, const flutter::MessageReply<EncodableValue>& reply) {
        try {
          const auto& args = std::get<EncodableList>(message);
          const auto& encodable_path_arg = args.at(0);
          if (encodable_path_arg.IsNull()) {
            reply(WrapError("path_arg unexpectedly null."));
            return;
          }
          const auto& path_arg = std::get<std::string>(encodable_path_arg);
          const auto& encodable_pitch_arg = args.at(1);
          if (encodable_pitch_arg.IsNull()) {
            reply(WrapError("pitch_arg unexpectedly null."));
            return;
          }
          const auto& pitch_arg = std::get<double>(encodable_pitch_arg);
          const auto& encodable_speed_arg = args.at(2);
          if (encodable_speed_arg.IsNull()) {
            reply(WrapError("speed_arg unexpectedly null."));
            return;
          }
          const int64_t speed_arg = encodable_speed_arg.LongValue();
          std::optional<FlutterError> output = api->PlayAudio(path_arg, pitch_arg, speed_arg);
          if (output.has_value()) {
            reply(WrapError(output.value()));
            return;
          }
          EncodableList wrapped;
          wrapped.push_back(EncodableValue());
          reply(EncodableValue(std::move(wrapped)));
        } catch (const std::exception& exception) {
          reply(WrapError(exception.what()));
        }
      });
    } else {
      channel.SetMessageHandler(nullptr);
    }
  }
  {
    BasicMessageChannel<> channel(binary_messenger, "dev.flutter.pigeon.audio_modulator.ExampleHostApi.stopAudio" + prepended_suffix, &GetCodec());
    if (api != nullptr) {
      channel.SetMessageHandler([api](const EncodableValue& message, const flutter::MessageReply<EncodableValue>& reply) {
        try {
          std::optional<FlutterError> output = api->StopAudio();
          if (output.has_value()) {
            reply(WrapError(output.value()));
            return;
          }
          EncodableList wrapped;
          wrapped.push_back(EncodableValue());
          reply(EncodableValue(std::move(wrapped)));
        } catch (const std::exception& exception) {
          reply(WrapError(exception.what()));
        }
      });
    } else {
      channel.SetMessageHandler(nullptr);
    }
  }
}

EncodableValue ExampleHostApi::WrapError(std::string_view error_message) {
  return EncodableValue(EncodableList{
    EncodableValue(std::string(error_message)),
    EncodableValue("Error"),
    EncodableValue()
  });
}

EncodableValue ExampleHostApi::WrapError(const FlutterError& error) {
  return EncodableValue(EncodableList{
    EncodableValue(error.code()),
    EncodableValue(error.message()),
    error.details()
  });
}

}  // namespace pigeon_example
