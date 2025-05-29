package com.jxut.courseware.springboot.entity;

import lombok.Data;

@Data
public class Subject {
    private Integer id;
    private String subjectName;
    private Integer creatorId;
    private Integer status;

    /**
     * 创建人真实姓名（非数据库字段，由 t_user.realname 关联而来）
     */
    private String creatorRealname;
}
