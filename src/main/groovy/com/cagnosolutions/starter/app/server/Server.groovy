package com.cagnosolutions.starter.app.server

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Entity
class Server {

    @Id
    @GeneratedValue
    Long id

    String host, database, username, password
}
