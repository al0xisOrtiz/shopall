package mx.ug.shopall.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mx.ug.shopall.model.Usuario;
import mx.ug.shopall.repository.UsuarioRepository;

@Service
public class UsuarioService {
    @Autowired
    UsuarioRepository repo;

    public List<Usuario> getAll() {
        List<Usuario> usuarios = new ArrayList<>();
        for(Usuario usuario : repo.findAll()) {
            usuarios.add(usuario);
        }
        return usuarios;
    }

    public void add(Usuario usuario) {
        repo.save(usuario);
    }
}
