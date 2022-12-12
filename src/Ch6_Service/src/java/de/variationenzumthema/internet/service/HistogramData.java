/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package de.variationenzumthema.internet.service;

import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ralph
 */
@XmlRootElement
public class HistogramData {
    private Integer[] data = {3, 11, 15, 20, 17, 20}; 

    public Integer[] getData() {
        return data;
    }

    public void setData(Integer[] data) {
        this.data = data;
    }    
}
