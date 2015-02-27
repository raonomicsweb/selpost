package org.selpost.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;

@Service
public class S3util {
	private String accessKey = "AKIAJG6QWNC57X3JGJJQ";
	private String secretKey = "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";
	
	private AmazonS3 conn;
	
	public S3util(){
		
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		ClientConfiguration clientConfig = new ClientConfiguration();
		clientConfig.setProtocol(Protocol.HTTP);
		this.conn = new AmazonS3Client(credentials, clientConfig);
		conn.setEndpoint("s3-ap-northeast-1.amazonaws.com");
	}
	
	//Bucket List
	public List<Bucket> getBuckList(){
		return conn.listBuckets();
	}
	
	//Bucket ����
	public Bucket createBucket(String bucketName){
		return conn.createBucket(bucketName);
	}
	
	//���� ���� (������ ���ϸ� �ڿ� "/",�� �ٿ��� �Ѵ�.)
	public void createFolder(String bucketName, String folderName){
		conn.putObject(bucketName, folderName +"/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
	}
	
	//���� ���ε�
	public void fileUpload(String bucketName, File file)throws FileNotFoundException{
		conn.putObject(bucketName, file.getName(), new FileInputStream(file), new ObjectMetadata());
	}
	
	//���� ����
	public void fileDelete(String buckName, String fileName){
		conn.deleteObject(buckName, fileName);
	}
	
	//���� URL
	public String getFileURL(String bucketName, String fileName){
		return conn.generatePresignedUrl(new GeneratePresignedUrlRequest(bucketName, fileName)).toString();
	}
}
