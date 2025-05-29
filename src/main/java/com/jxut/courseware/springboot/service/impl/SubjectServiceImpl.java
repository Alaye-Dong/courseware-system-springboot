package com.jxut.courseware.springboot.service.impl;

import com.jxut.courseware.springboot.entity.Subject;
import com.jxut.courseware.springboot.mapper.SubjectMapper;
import com.jxut.courseware.springboot.service.SubjectService;
import com.jxut.courseware.springboot.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectMapper subjectMapper;

    @Override
    public List<Subject> searchSubjects(String subjectName) {
        return subjectMapper.searchBySubjectName(subjectName == null ? "" : subjectName);
    }

    @Override
    public void addSubject(String subjectName, int creatorId) {
        Subject subject = new Subject();
        subject.setSubjectName(subjectName);
        subject.setCreatorId(creatorId);
        subject.setStatus(1); // 默认启用
        subjectMapper.insertSubject(subject);
    }

    @Override
    public void changeStatus(int id, int status) {
        subjectMapper.updateStatusById(id, status);
    }

    @Override
    public PageBean<Subject> searchSubjects(String subjectName, int currentPage, int pageSize) {
    int totalItems = subjectMapper.countSubjectsByName(subjectName == null ? "" : subjectName);
    int start = (currentPage - 1) * pageSize;
    List<Subject> subjects = subjectMapper.searchBySubjectNameWithPage(
            subjectName == null ? "" : subjectName, start, pageSize);
    return new PageBean<>(currentPage, pageSize, totalItems, subjects);
}

}
