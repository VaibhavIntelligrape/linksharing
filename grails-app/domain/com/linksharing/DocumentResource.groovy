package com.linksharing

class DocumentResource extends Resource {

    String fileName;
    String contentType;

    static constraints = {
        fileName(blank: false,nullable: false)
        contentType(blank: false,nullable: false)
    }




}

