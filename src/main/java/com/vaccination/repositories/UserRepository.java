package com.vaccination.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vaccination.entities.UserCredentials;


@Repository
public interface UserRepository extends JpaRepository<UserCredentials, Integer>{

}
