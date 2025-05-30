package com.jxut.courseware.springboot.mapper;

import com.jxut.courseware.springboot.entity.Subject;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SubjectMapper {

    // 按科目名模糊查询
    List<Subject> searchBySubjectName(@Param("subjectName") String subjectName);

    // 添加科目
    void insertSubject(Subject subject);

    // 修改状态
    void updateStatusById(@Param("id") Integer id, @Param("status") Integer status);

    // 新增：带分页查询
    List<Subject> searchBySubjectNameWithPage(@Param("subjectName") String subjectName,
                                              @Param("start") int start,
                                              @Param("pageSize") int pageSize);

    // 新增：统计数量
    int countSubjectsByName(@Param("subjectName") String subjectName);
}
