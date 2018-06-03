/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.pinmyhelp.model.dao;

import br.com.pinmyhelp.database.AbstractDAO;
import br.com.pinmyhelp.model.Address;
import br.com.pinmyhelp.model.Claimant;
import br.com.pinmyhelp.model.Person;
import br.com.pinmyhelp.model.Voluntary;
import br.com.pinmyhelp.model.types.GeoLocation;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
/**
 *
 * @author rhau
 */
public class PersonDAO extends AbstractDAO<Person>{
    
    public PersonDAO(){
        setCreateSql("INSERT INTO person (person_id, person_type, person_name, cpf, rg, born_date, person_first_phone) VALUES (?, ?, ?, ?, ?, ?, ?)");
        setUpdateSql("UPDATE person SET person_name = ?, cpf = ?, rg = ?, born_date = ?, "
                + "person_first_phone = ?, person_second_phone = ?, profile_picture = ?, biography = ?, "
                + "person_score = ?, person_notes = ?, p_postal_code = ?, p_neighborhood = ?, "
                + "p_street = ?, p_number = ?, p_complement = ?, p_latitude = ?, p_longitude = ? WHERE person_id = ?");
        setDeleteSql("DELETE FROM person WHERE person_id = ?");
        setFindOneSql("SELECT * FROM person WHERE person_id = ?");
        setFindSql("SELECT * FROM person WHERE person_type = ?");
        setFindAllSql("SELECT * FROM person");
    }

    @Override
    protected void fillCreate(PreparedStatement ps, Person p) throws SQLException {
        ps.setInt(1, p.getId());
        
        //Definir tipo descobrindo qual classe está instanciando
        if(p instanceof Voluntary){
            ps.setString(2, "Voluntary");
        } else if (p instanceof Claimant){
            ps.setString(2, "Claimant");
        }        
        //OU fazer com o tipo definido nas classes voluntary ou claimant
        //ps.setString(2, p.getType());
        
        ps.setString(3, p.getName());
        ps.setString(4, p.getCpf());
        ps.setString(5, p.getRg());
        ps.setDate(6, java.sql.Date.valueOf(p.getBornDate()));
        ps.setString(7, p.getFirstPhone());
    }

    @Override
    protected void fillUpdate(PreparedStatement ps, Person p) throws SQLException {
        ps.setString(1, p.getName());
        ps.setString(2, p.getCpf());
        ps.setString(3, p.getRg());
        ps.setDate(4, java.sql.Date.valueOf(p.getBornDate()));
        ps.setString(5, p.getFirstPhone());
        ps.setString(6, p.getSecondPhone());
        ps.setString(7, p.getProfilePicture());
        ps.setString(8, p.getBiography());
        ps.setDouble(9, p.getScore());
        ps.setString(10, p.getNotes());
        ps.setString(11, p.getAddress().getPostalCode());
        ps.setString(12, p.getAddress().getNeighborhood());
        ps.setString(13, p.getAddress().getStreet());
        ps.setInt(14, p.getAddress().getNumber());
        ps.setString(15, p.getAddress().getComplement());
        ps.setDouble(16, p.getAddress().getLocation().getLatitude());
        ps.setDouble(17, p.getAddress().getLocation().getLongitude());
        ps.setInt(18, p.getId());
    }

    @Override
    protected void fillDelete(PreparedStatement ps, Person p) throws SQLException {
        ps.setInt(1, p.getId());
    }

    @Override
    protected void fillFind(PreparedStatement ps, Person p) throws SQLException {
        ps.setString(1, p.getType());
    }

    @Override
    protected Person fillRecord(ResultSet rs) throws SQLException {
        Person p = new Person();
        p.setId(rs.getInt("person_id"));
        p.setType(rs.getString("person_type"));
        p.setName(rs.getString("person_name"));
        p.setCpf(rs.getString("cpf"));
        p.setRg(rs.getString("cpf"));
        p.setBornDate(rs.getDate("born_date").toLocalDate());
        p.setCpf(rs.getString("cpf"));
        p.setFirstPhone(rs.getString("person_first_phone"));
        p.setSecondPhone(rs.getString("person_second_phone"));
        p.setProfilePicture(rs.getString("profile_picture"));
        p.setBiography(rs.getString("biography"));
        p.setScore(rs.getDouble("person_score"));
        p.setNotes(rs.getString("person_notes"));
        Address address = new Address();
        address.setPostalCode(rs.getString("p_postal_code"));
        address.setNeighborhood(rs.getString("p_neighborhood"));
        address.setStreet(rs.getString("p_street"));
        address.setNumber(rs.getInt("p_number"));
        address.setComplement(rs.getString("p_complement"));
        address.setLocation(
                new GeoLocation(rs.getDouble("p_latitude"), rs.getDouble("p_longitude"))
        );
        p.setAddress(address);  
        return p;
    }

}