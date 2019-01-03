package com.snack.service.impl;

import com.snack.mapper.RoleMapper;
import com.snack.model.Role;
import com.snack.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper mapper;

    public List<Role> getAllRoles(){
        return mapper.getAllRoles();
    }
}
