/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.pinmyhelp.model;

import br.com.pinmyhelp.database.Record;
import br.com.pinmyhelp.model.types.Rating;
import java.io.Serializable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 *
 * @author rhau
 */
public class Feedback extends Record implements Serializable {

    private User sender;
    @NotNull(message = "Você deve dar uma nota de avaliação")
    @Pattern(regexp = "[\\d]{6}", message = "Tipo de dado inválido no campo avaliação.")
    private Rating rating;
    private String comments;
    private HelpSolicitation solicitation;
    private HelpOffer offer; //Oferta que foi dado feedback

    public Feedback() {
    }

    public Feedback(Integer id) {
        super(id);
    }

    public Feedback(User sender, int rating, String comments) {
        this.sender = sender;
        this.rating = Rating.get(rating);
        this.comments = comments;
    }

    /**
     * @return the sender
     */
    public User getSender() {
        return sender;
    }

    /**
     * @param sender the sender to set
     */
    public void setSender(User sender) {
        this.sender = sender;
    }

    /**
     * @return the rating
     */
    public Rating getRating() {
        return rating;
    }

    /**
     * @param rating the rating to set
     */
    public void setRating(int rating) {
        this.rating = Rating.get(rating);
    }

    /**
     * @return the comments
     */
    public String getComments() {
        return comments;
    }

    /**
     * @param comments the comments to set
     */
    public void setComments(String comments) {
        this.comments = comments;
    }

    /**
     * @return the solicitation
     */
    public HelpSolicitation getSolicitation() {
        return solicitation;
    }

    /**
     * @param solicitation the solicitation to set
     */
    public void setSolicitation(HelpSolicitation solicitation) {
        this.solicitation = solicitation;
    }


    /**
     * @return the offer
     */
    public HelpOffer getOffer() {
        return offer;
    }

    /**
     * @param offer the offer to set
     */
    public void setOffer(HelpOffer offer) {
        this.offer = offer;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("Feedback{ sender_id = ");
        builder.append(sender.getId());
        builder.append(", rating = ");
        builder.append(rating.getValue());
        builder.append(", comments = ");
        builder.append(comments);
        if (solicitation != null){
            builder.append(", solicitation_id = ");
            builder.append(solicitation.getId());
        }
        if (offer != null){
            builder.append(", offer_id = ");
            builder.append(offer.getId());
        }
        builder.append("}");
        //return "Feedback{" + "sender=" + sender + ", rating=" + rating + ", comments=" + comments + '}';
        return builder.toString();
    }
    
}
