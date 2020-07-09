# Flutter_Google_Validator

根据给定的密钥获取谷歌验证码
使用otp中的OTP.generateTOTPCodeString(XXX, XXX);算法生成

#遇到的问题
Android端需要添加相机使用权限
iOS端的podfile中需要确认使用#use_frameworks!命令并pod install整个项目
生成验证码是在单个单元内生成，不是在点击添加或者扫描之后生成，因为验证码是定时生成并变化的
倒计时是单个单元的部件，不属于整体
