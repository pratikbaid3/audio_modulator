// Autogenerated from Pigeon (v22.7.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PGNCode) {
  PGNCodeOne = 0,
  PGNCodeTwo = 1,
};

/// Wrapper for PGNCode to allow for nullability.
@interface PGNCodeBox : NSObject
@property(nonatomic, assign) PGNCode value;
- (instancetype)initWithValue:(PGNCode)value;
@end

@class PGNMessageData;

@interface PGNMessageData : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithName:(nullable NSString *)name
    description:(nullable NSString *)description
    code:(PGNCode)code
    data:(NSDictionary<NSString *, NSString *> *)data;
@property(nonatomic, copy, nullable) NSString * name;
@property(nonatomic, copy, nullable) NSString * description;
@property(nonatomic, assign) PGNCode code;
@property(nonatomic, copy) NSDictionary<NSString *, NSString *> * data;
@end

/// The codec used by all APIs.
NSObject<FlutterMessageCodec> *PGNGetMessagesCodec(void);

@protocol PGNExampleHostApi
- (void)playAudioPath:(NSString *)path pitch:(double)pitch speed:(NSInteger)speed error:(FlutterError *_Nullable *_Nonnull)error;
- (void)stopAudioWithError:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void SetUpPGNExampleHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PGNExampleHostApi> *_Nullable api);

extern void SetUpPGNExampleHostApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PGNExampleHostApi> *_Nullable api, NSString *messageChannelSuffix);

NS_ASSUME_NONNULL_END
