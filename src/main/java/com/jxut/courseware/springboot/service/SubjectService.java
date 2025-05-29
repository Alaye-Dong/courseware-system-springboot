package com.jxut.courseware.springboot.service;

import com.jxut.courseware.springboot.entity.Subject;

import java.util.List;

public interface SubjectService {
    List<Subject> searchSubjects(String subjectName);
    void addSubject(String subjectName, int creatorId);
    void changeStatus(int id, int status);
}
