import request from '@/utils/request'

export default {
  // 讲师列表（条件查询分页）
  // current当前页 limit每页记录数 cameraQuery条件对象
  getCameraListPage(current, limit) {
    return request({
      // url: '/eduservice/teacher/pageTeacherCondition/'+current+"/"+limit,
      url: `/page/${current}/${limit}`,
      method: 'get'
      // teacherQuery条件对象，后端使用RequestBody获取对象
      // data表示把对象转换json进行传递到接口里面
    })
  },
  // 删除讲师
  deleteCameraInfo(mediaKey) {
    return request({
      url: `/del/${mediaKey}`,
      method: 'delete'
    })
  },
  // 添加讲师
  addCameraInfo(camera) {
    return request({
      url: `/add`,
      method: 'post',
      data: camera
    })
  },
  // 根据id查询讲师，回显数据
  getCameraInfo(mediaKey) {
    return request({
      url: `/info/${mediaKey}`,
      method: 'get'
    })
  },
  // 讲师列表
  getCameraList() {
    return request({
      url: `/camera/query_all`,
      method: 'get'
    })
  },
  // 修改讲师
  updateCameraInfo(camera) {
    return request({
      url: `/update`,
      method: 'post',
      data: camera
    })
  },
  // 修改讲师
  updateCameraStatus(camera) {
    return request({
      url: `/update/status`,
      method: 'put',
      data: camera
    })
  }
}
