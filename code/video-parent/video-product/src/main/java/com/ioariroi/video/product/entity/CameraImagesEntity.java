package com.ioariroi.video.product.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 攝像機图片
 * 
 * @author ioariroi
 * @email ioariroi@gmail.com
 * @date 2022-03-19 21:58:08
 */
@Data
@TableName("pms_camera_images")
public class CameraImagesEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Long id;
	/**
	 * spu_id
	 */
	private Long cameraId;
	/**
	 * 图片名
	 */
	private String name;
	/**
	 * 图片地址
	 */
	private String url;
	/**
	 * 顺序
	 */
	private Integer sort;
	/**
	 * 是否默认图
	 */
	private Integer defaultImg;
	/**
	 * 
	 */
	private Date createTime;
	/**
	 * 
	 */
	private Date updateTime;

}
