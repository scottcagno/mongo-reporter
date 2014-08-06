package com.cagnosolutions.starter.app.server
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.mvc.support.RedirectAttributes

/**
 * Created by Scott Cagno.
 * Copyright Cagno Solutions. All rights reserved.
 */

@Controller
@RequestMapping("/server")
class ServerController {

    @Autowired
    ServerService serverService

    @RequestMapping(method=RequestMethod.GET)
    String viewAll(Model model) {
        model.addAttribute "servers", serverService.findAll()
        "server/server"
    }

    @RequestMapping(method=RequestMethod.POST)
    String addOrEdit(Server server) {
        serverService.save server
        "redirect:/server"
    }

    @RequestMapping(value="/{id}", method=RequestMethod.GET)
    String view(@PathVariable Long id, Model model) {
        model.addAllAttributes([server: serverService.findOne(id), servers: serverService.findAll()])
        "server/server"
    }

    @RequestMapping(value="/{id}", method=RequestMethod.POST)
    String delete(@PathVariable Long id) {
        serverService.delete id
        "redirect:/server"
    }

    @RequestMapping(value="/{id}/connection", method=RequestMethod.GET)
    String connection(@PathVariable Long id, RedirectAttributes attr) {
        def server = serverService.findOne(id)
        attr.addFlashAttribute "alertSuccess", "Successfully connected to ${server.host}"
        "redirect:/server"
    }
}
