
/**
 * @Author:      Fly
 * @Email:       xx@xx.com
 * @DateTime:    2017-05-15 17:49:35
 * @Description: 命令行控制手机震动与响铃
 */

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
extern CFRunLoopRunResult CFRunLoopRunInMode(CFStringRef modeName, CFTimeInterval seconds, Boolean stopAfterHandle);
/**
 * @function:      
 * @abstract:     震动
 * @discussion:      null
 * @param:      null
 */

void vibrate()
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}
/**
 * @function:      
 * @abstract:      响铃
 * @discussion:      
 * @param:      
 */

void playSound()
{
    SystemSoundID soundId = 0;
    NSString * path = @"/System/Library/Audio/UISounds/sms-received5.caf";
    if (path) {
        AudioServicesCreateSystemSoundID((__bridge  CFURLRef)[NSURL fileURLWithPath:path], &soundId);
        AudioServicesPlaySystemSound(soundId);
    }
}

/**
 * @function:      
 * @abstract:      震动并响铃
 * @discussion:      
 * @param:      
 */

void vibrateAndPlaySound()
{
    vibrate();
    playSound();

}

int main(int argc, char **argv, char **envp) {

	@autoreleasepool {
		
		vibrateAndPlaySound(0);
        CFRunLoopRunInMode(kCFRunLoopDefaultMode,1.0,YES);
		return 0;
	}
}

