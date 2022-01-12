package com.flight.reservation.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.flight.reservation.entities.Role;


public interface RoleRepository extends JpaRepository<Role, Long> 
{

}
