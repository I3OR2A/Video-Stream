package com.ioariroi.video.product.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ioariroi.video.product.entity.CameraInfoEntity;
import com.ioariroi.video.product.service.CameraInfoService;
import com.ioariroi.common.utils.PageUtils;
import com.ioariroi.common.utils.R;



/**
 * 攝像機資訊
 *
 * @author ioariroi
 * @email ioariroi@gmail.com
 * @date 2022-03-19 21:58:08
 */
@RestController
@RequestMapping("product/camerainfo")
public class CameraInfoController {
    @Autowired
    private CameraInfoService cameraInfoService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = cameraInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
		CameraInfoEntity cameraInfo = cameraInfoService.getById(id);

        return R.ok().put("cameraInfo", cameraInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody CameraInfoEntity cameraInfo){
		cameraInfoService.save(cameraInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody CameraInfoEntity cameraInfo){
		cameraInfoService.updateById(cameraInfo);

        return R.ok();
    }

    /**
     * 修改状态
     */
    @RequestMapping("/update/status")
    public R updateStatus(@RequestBody CameraInfoEntity cameraInfo) {
        cameraInfoService.updateById(cameraInfo);
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
		cameraInfoService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
