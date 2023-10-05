package mx.ug.shopall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import mx.ug.shopall.model.Usuario;
import mx.ug.shopall.service.UsuarioService;

@RestController
@RequestMapping("/usuarios")
public class UsuarioController {
    @Autowired
    UsuarioService ser;

    @PostMapping("/add")
    public void add(@RequestBody Usuario body) {
        ser.add(body);
    }

    @GetMapping("/getAll")
    public List<Usuario> getAll() {
        return ser.getAll();
    }
}
