package com.zj.controller;

import java.util.ArrayList;
import java.util.List;

import com.zj.service.HlsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zj.common.AjaxResult;
import com.zj.dto.CameraDto;
import com.zj.entity.Camera;
import com.zj.mapper.CameraMapper;
import com.zj.service.MediaService;
import com.zj.vo.CameraVo;

import cn.hutool.crypto.digest.MD5;

/**
 * api管理接口
 * 后续可能改为使用数据库
 * @author ZJ
 *
 */
@RestController
@CrossOrigin  //解决跨域
public class StreamController {
	
	@Autowired
	private MediaService mediaService;
	@Autowired
	private CameraMapper cameraMapper;
	@Autowired
	private HlsService hlsService;
	/**
	 * 分页查询
	 * @param current
	 * @param limit
	 * @return
	 */
	@GetMapping("page/{current}/{limit}")
	public AjaxResult page(Long current, Long limit) {
		if(null == current || current <= 1) {
			current = 1L;
		}
		if(null == limit || limit <= 10) {
			limit = 10L;
		}
		Page<Camera> page = new Page<>();
		page.setCurrent(current);
		page.setSize(limit);
		page.addOrder(OrderItem.desc("id"));
		
		QueryWrapper<Camera> queryWrapper = new QueryWrapper<>();
		Page<Camera> cameraPage = cameraMapper.selectPage(page, queryWrapper);

		long total = cameraPage.getTotal();//总记录数
		List<Camera> records = cameraPage.getRecords();//数据list集合
		List<CameraVo> rData = new ArrayList<>();
		for (Camera camera : records) {
			CameraVo cameraVo = new CameraVo();
			cameraVo.setEnabledFlv(camera.getFlv() == 1 ? true : false);
			cameraVo.setEnabledHls(camera.getHls() == 1 ? true : false);
			cameraVo.setMode(camera.getFfmpeg() == 1 ? "ffmpeg" : "javacv");
			cameraVo.setRemark(camera.getRemark());
			cameraVo.setUrl(camera.getUrl());
			cameraVo.setMediaKey(camera.getMediaKey());
			rData.add(cameraVo);
		}

		return AjaxResult.ok().data("total",total).data("data",rData);
	}

	/**
	 * 查询所有流
	 * @return
	 */
	@GetMapping("info/{mediaKey}")
	public AjaxResult info(@PathVariable String mediaKey) {
		QueryWrapper<Camera> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("media_key", mediaKey);
		Camera camera = cameraMapper.selectOne(queryWrapper);
		CameraVo cameraVo = new CameraVo();
		cameraVo.setEnabledFlv(camera.getFlv() == 1 ? true : false);
		cameraVo.setEnabledHls(camera.getHls() == 1 ? true : false);
		cameraVo.setMode(camera.getFfmpeg() == 1 ? "ffmpeg" : "javacv");
		cameraVo.setRemark(camera.getRemark());
		cameraVo.setUrl(camera.getUrl());
		cameraVo.setMediaKey(camera.getMediaKey());
		return AjaxResult.ok().data("data", cameraVo);
	}
	
	/**
	 * 查询所有流
	 * @return
	 */
	@GetMapping("list")
	public AjaxResult list() {
		List<Camera> data = cameraMapper.selectList(null);
		List<CameraVo> rData = new ArrayList<>();
		for (Camera camera : data) {
			CameraVo cameraVo = new CameraVo();
			cameraVo.setEnabledFlv(camera.getFlv() == 1 ? true : false);
			cameraVo.setEnabledHls(camera.getHls() == 1 ? true : false);
			cameraVo.setMode(camera.getFfmpeg() == 1 ? "ffmpeg" : "javacv");
			cameraVo.setRemark(camera.getRemark());
			cameraVo.setUrl(camera.getUrl());
			cameraVo.setMediaKey(camera.getMediaKey());
			rData.add(cameraVo);
		}
		return AjaxResult.ok().data("data", rData);
	}
	
	/**
	 * 新增流
	 * @param cameraVo
	 * @return
	 */
	@PostMapping("add")
	public AjaxResult add(@RequestBody CameraVo cameraVo) {
		String digestHex = MD5.create().digestHex(cameraVo.getUrl());
		
		Camera camera = new Camera();
		camera.setMediaKey(digestHex);
		
		QueryWrapper<Camera> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("media_key", digestHex);
		Integer selectCount = cameraMapper.selectCount(queryWrapper);
		if(selectCount > 0) {
			return AjaxResult.error().message("数据库里已有此地址");
		}
		
		camera.setUrl(cameraVo.getUrl());
		camera.setRemark(cameraVo.getRemark());
		int save = cameraMapper.insert(camera);
		return save == 1 ? AjaxResult.ok().message("新增成功") : AjaxResult.error().message("新增失败");
	}
	
	/**
	 * 编辑流
	 * @param cameraVo
	 * @return
	 */
	@PostMapping("update")
	public AjaxResult edit(@RequestBody CameraVo cameraVo) {
		String digestHex = MD5.create().digestHex(cameraVo.getUrl());
		QueryWrapper<Camera> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("media_key", digestHex);
		Camera selectOne = cameraMapper.selectOne(queryWrapper);
		selectOne.setRemark(cameraVo.getRemark());
		if(null != selectOne) {
			int res = cameraMapper.update(selectOne, queryWrapper);
		}
		
		return AjaxResult.ok().message("编辑成功");
	}

	/**
	 * 编辑流
	 * @param cameraVo
	 * @return
	 */
	@PutMapping("update/status")
	public AjaxResult updateFlvStatus(@RequestBody CameraVo cameraVo) {
		String digestHex = MD5.create().digestHex(cameraVo.getUrl());
		QueryWrapper<Camera> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("media_key", digestHex);

		CameraDto cameraDto = new CameraDto();
		cameraDto.setUrl(cameraVo.getUrl());
		cameraDto.setMediaKey(digestHex);

		if (cameraVo.isEnabledFlv()) {

			boolean playForApi = mediaService.playForApi(cameraDto);

			if(playForApi) {
				Camera camera = new Camera();
				camera.setFlv(1);
				int res = cameraMapper.update(camera, queryWrapper);
			}
		}else {
			mediaService.closeForApi(cameraDto);

			Camera camera = new Camera();
			camera.setFlv(0);
			int res = cameraMapper.update(camera, queryWrapper);
		}

		if(cameraVo.isEnabledHls()){
			boolean startConvertToHls = hlsService.startConvertToHls(cameraDto);

			if(startConvertToHls) {
				Camera camera = new Camera();
				camera.setHls(1);
				int res = cameraMapper.update(camera, queryWrapper);
			}
		}else {
			Camera camera = new Camera();
			camera.setHls(0);
			int res = cameraMapper.update(camera, queryWrapper);

			hlsService.closeConvertToHls(cameraDto);
		}

		return AjaxResult.ok().message("编辑成功");
	}

	/**
	 * 删除流（会停止推流）
	 * @param mediaKey
	 * @return
	 */
	@DeleteMapping("del/{mediaKey}")
	public AjaxResult del(@PathVariable String mediaKey) {
//		String digestHex = MD5.create().digestHex(cameraVo.getUrl());
//		Camera camera = new Camera();
//		camera.setMediaKey(digestHex);

		QueryWrapper<Camera> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("media_key", mediaKey);
		Camera camera = cameraMapper.selectOne(queryWrapper);
		if(null != camera) {
			cameraMapper.delete(queryWrapper);
		}

		CameraDto cameraDto = new CameraDto();
		cameraDto.setUrl(camera.getUrl());
		cameraDto.setMediaKey(mediaKey);
		mediaService.closeForApi(cameraDto);
		return AjaxResult.ok().message("删除成功");
	}
	
	/**
	 * 停止推流
	 * @param cameraVo
	 * @return
	 */
	@RequestMapping("stop")
	public AjaxResult stop(CameraVo cameraVo) {
		String digestHex = MD5.create().digestHex(cameraVo.getUrl());
		CameraDto cameraDto = new CameraDto();
		
		Camera camera = new Camera();
		camera.setFlv(0);
		QueryWrapper<Camera> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("media_key", digestHex);
		int res = cameraMapper.update(camera, queryWrapper);
		
		cameraDto.setUrl(cameraVo.getUrl());
		cameraDto.setMediaKey(digestHex);
		mediaService.closeForApi(cameraDto);
		return AjaxResult.ok().message("停止推流成功");
	}
	
	/**
	 * 开始推流
	 * @param cameraVo
	 * @return
	 */
	@RequestMapping("start")
	public AjaxResult start(CameraVo cameraVo) {
		String digestHex = MD5.create().digestHex(cameraVo.getUrl());
		CameraDto cameraDto = new CameraDto();
		cameraDto.setUrl(cameraVo.getUrl());
		cameraDto.setMediaKey(digestHex);
		cameraDto.setAutoClose(false);
		boolean playForApi = mediaService.playForApi(cameraDto);
		
		if(playForApi) {
			Camera camera = new Camera();
			QueryWrapper<Camera> queryWrapper = new QueryWrapper<>();
			queryWrapper.eq("media_key", digestHex);
			camera.setFlv(1);
			int res = cameraMapper.update(camera, queryWrapper);
		}
		
		return playForApi ? AjaxResult.ok().message("开启推流成功") : AjaxResult.error().message("开启失败");
	}
	
}
