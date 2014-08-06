package com.cagnosolutions.starter.app.server

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository
import org.springframework.stereotype.Service

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Service
class ServerService {

    @Autowired
    ServerRepository repo

    List<Server> findAll() {
        repo.findAll()
    }

    Server findOne(Long id) {
        repo.findOne id
    }

    Server save(Server server) {
        repo.save server
    }

    def delete(Long id) {
        repo.delete id
    }

    def delete(Server server) {
        repo.delete server
    }
}

@Repository
interface ServerRepository extends JpaRepository<Server, Long> {

}
