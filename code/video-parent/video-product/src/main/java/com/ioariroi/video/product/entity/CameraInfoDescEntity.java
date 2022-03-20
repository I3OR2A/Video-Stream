package com.ioariroi.video.product.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 攝像機資訊介绍
 * 
 * @author ioariroi
 * @email ioariroi@gmail.com
 * @date 2022-03-19 21:58:08
 */
@Data
@TableName("pms_camera_info_desc")
public class CameraInfoDescEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 攝像機介紹id
	 */
	@TableId
	private Long id;
	/**
	 * 攝像機id
	 */
	private Long cameraId;
	/**
	 * 攝像機介绍
	 */
	private String description;
	/**
	 * 
	 */
	private Date createTime;
	/**
	 * 
	 */
	private Date updateTime;

}
