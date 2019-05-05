#import "SahandDatepickerPlugin.h"
#import <sahand_datepicker_plugin/sahand_datepicker_plugin-Swift.h>

@implementation SahandDatepickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSahandDatepickerPlugin registerWithRegistrar:registrar];
}
@end
