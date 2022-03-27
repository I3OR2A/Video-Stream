package com.zj.common;

import java.util.HashMap;
import java.util.Map;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.http.HttpStatus;
import lombok.Data;

/**
 * 操作消息提醒
 * 
 */
@Data
public class AjaxResult {
	private static final long serialVersionUID = 1L;
	private boolean success;

	private Integer code;

	private String message;

	private Map<String, Object> data = new HashMap<String, Object>();

	private AjaxResult(){}


	public static AjaxResult ok(){
		AjaxResult r = new AjaxResult();
		r.setSuccess(true);
		r.setCode(ResultCode.OK);
		r.setMessage("成功");
		return r;
	}

	public static AjaxResult error(){
		AjaxResult r = new AjaxResult();
		r.setSuccess(false);
		r.setCode(ResultCode.ERROR);
		r.setMessage("失败");
		return r;
	}



	public AjaxResult message(String message){
		this.setMessage(message);
		return this;
	}

	public AjaxResult code(Integer code){
		this.setCode(code);
		return this;
	}

	public AjaxResult data(String key, Object value){
		this.data.put(key, value);
		return this;
	}

	public AjaxResult data(Map<String, Object> map){
		this.setData(map);
		return this;
	}

}
