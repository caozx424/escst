package com.escst.hxgt.service.mongodb;

import java.io.IOException;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.MongoDbFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;

@Service
public class MongoDBService {

    @Autowired
    private MongoDbFactory mongoDbFactory;

    public GridFSInputFile save(MultipartFile file){
        GridFS gridFS = new GridFS(mongoDbFactory.getDb());
        GridFSInputFile gridFSInputFile = null;
        try {
            gridFSInputFile = gridFS.createFile(file.getInputStream());
            gridFSInputFile.setId(UUID.randomUUID().toString());
            gridFSInputFile.save();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return gridFSInputFile;
    }

    public GridFSDBFile getById(Object id){
        DBObject query = new BasicDBObject("_id", id);
        GridFS gridFS = new GridFS(mongoDbFactory.getDb());
        GridFSDBFile gridFSDBFile = gridFS.findOne(query);
        return gridFSDBFile;
    }

}
