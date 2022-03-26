package com.ioariroi.video.thirdparty.controller;


import com.ioariroi.common.utils.R;
import com.sun.jna.Pointer;
import com.sun.jna.platform.win32.Kernel32;
import com.sun.jna.platform.win32.WinNT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ThreadPoolExecutor;

@RestController
@RequestMapping("/sms")
public class OssController {
    /**
     * 自定义线程串池
     */
    @Autowired
    private ThreadPoolExecutor executor;

    /*** 提供给别的服务进行调用的
     */
    @GetMapping("/sendcode")
    public R sendCode(){
//        if(!"fail".equals(smsComponent.sendSmsCode(phone, code).split("_")[0])){
//            return R.ok();
//        }
//        return R.error(BizCodeEnum.SMS_SEND_CODE_EXCEPTION.getCode(), BizCodeEnum.SMS_SEND_CODE_EXCEPTION.getMsg());

        String command = "ffmpeg -i \"rtsp://tapoadmin:tapoadmin@192.168.68.112:554/stream1\" -fflags flush_packets -max_delay 1 -an -flags -global_header -hls_time 1 -hls_list_size 3 -hls_flags 3 -vcodec copy -f flv -r 25 -an rtmp://127.0.0.1:4848/hls/test";

        long result = -1;
        try
        {
            Process p = Runtime.getRuntime().exec(command);
//            CompletableFuture<Process> infoFutrue = CompletableFuture.supplyAsync(() -> {
//                try {
//                    return Runtime.getRuntime().exec(command);
//                } catch (IOException e) {
//                    return null;
//                }
//            }, executor);
//
//            Process p = infoFutrue.get();

            //for windows
            if (p.getClass().getName().equals("java.lang.Win32Process") ||
                    p.getClass().getName().equals("java.lang.ProcessImpl"))
            {
                Field f = p.getClass().getDeclaredField("handle");
                f.setAccessible(true);
                long handl = f.getLong(p);
                Kernel32 kernel = Kernel32.INSTANCE;
                WinNT.HANDLE hand = new WinNT.HANDLE();
                hand.setPointer(Pointer.createConstant(handl));
                result = kernel.GetProcessId(hand);
                f.setAccessible(false);
            }
            //for unix based operating systems
            else if (p.getClass().getName().equals("java.lang.UNIXProcess"))
            {
                Field f = p.getClass().getDeclaredField("pid");
                f.setAccessible(true);
                result = f.getLong(p);
                f.setAccessible(false);
            }

            return R.ok().put("pid", result);
        }
        catch(Exception ex)
        {
            return R.error(ex.getMessage());
        }
    }


    @GetMapping("/kill")
    public R kill(@RequestParam("pid") Long pid){
        return R.ok();
    }
}
