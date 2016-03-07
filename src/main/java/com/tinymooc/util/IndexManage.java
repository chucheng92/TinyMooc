//package com.tinymooc.util;
//
//import java.io.File;
//
//import org.apache.lucene.analysis.Analyzer;
//import org.apache.lucene.document.Document;
//import org.apache.lucene.document.Field.Store;
//import org.apache.lucene.document.StringField;
//import org.apache.lucene.document.TextField;
//import org.apache.lucene.index.IndexWriter;
//import org.apache.lucene.index.IndexWriterConfig;
//import org.apache.lucene.index.Term;
//import org.apache.lucene.index.IndexWriterConfig.OpenMode;
//import org.apache.lucene.search.BooleanQuery;
//import org.apache.lucene.search.TermQuery;
//import org.apache.lucene.search.BooleanClause.Occur;
//import org.apache.lucene.store.Directory;
//import org.apache.lucene.store.FSDirectory;
//import org.apache.lucene.util.Version;
//import com.tinymooc.common.domain.DocModel;
//import org.wltea.analyzer.lucene.IKAnalyzer;
//
//public class IndexManage {
//
//	private String indexPath="D:/lucene/index4";
//	private Directory dir;
//
//    private IndexWriter getWriter() throws Exception{
//    	Analyzer analyzer=new IKAnalyzer();
//    	IndexWriterConfig config=new IndexWriterConfig(Version.LUCENE_43, analyzer);
//    	config.setOpenMode(OpenMode.CREATE_OR_APPEND);
//    	return new IndexWriter(dir,config);
//    }
//
//    //添加索引
//	public void addIndex(DocModel docModel) {
//		try {
//			dir=FSDirectory.open(new File(indexPath));
//			IndexWriter writer=getWriter();
//			Document document=new Document();
//			document.add(new TextField("nickname", docModel.getNickName(), Store.YES));
//			document.add(new TextField("teamName", docModel.getTeamName(), Store.YES));
//			document.add(new TextField("couseTitle", docModel.getCourseTitle(), Store.YES));
//			document.add(new TextField("topic", docModel.getTopic(), Store.YES));
//		    document.add(new StringField("userId", docModel.getUserId(), Store.YES));
//		    document.add(new StringField("userTeamId", docModel.getUserTeamId(), Store.YES));
//		    document.add(new StringField("userCourseId", docModel.getUserCourseId(), Store.YES));
//		    document.add(new StringField("discussId", docModel.getDiscussId(), Store.YES));
//		    document.add(new StringField("type", docModel.getType(), Store.YES));
//		    writer.addDocument(document);
//		    //writer.forceMerge(1);
//		    writer.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		};
//	}
//
//	//删除索引
//	public void deleteIndex(DocModel docModel) {
//		try {
//			dir=FSDirectory.open(new File(indexPath));
////			IndexReader reader=DirectoryReader.open(dir);
//			IndexWriter writer=getWriter();
//			if(docModel.getType().equals("用户")){
//				Term term1=new Term("userId",docModel.getUserId());
//				Term term2=new Term("type",docModel.getType());
//				deleterocess(term1, term2, writer);
//			}
//			if(docModel.getType().equals("小组")){
//				Term term1=new Term("userTeamId",docModel.getUserTeamId());
//				Term term2=new Term("type",docModel.getType());
//				deleterocess(term1, term2, writer);
//			}
//			if(docModel.getType().equals("课程")){
//				Term term1=new Term("userID",docModel.getUserCourseId());
//				Term term2=new Term("type",docModel.getType());
//				deleterocess(term1, term2, writer);
//			}
//			if(docModel.getType().equals("讨论")){
//				Term term1=new Term("userID",docModel.getDiscussId());
//				Term term2=new Term("type",docModel.getType());
//				deleterocess(term1, term2, writer);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	public void deleterocess(Term term1,Term term2,IndexWriter writer) throws Exception{
//		TermQuery termQuery1=new TermQuery(term1);
//		TermQuery termQuery2=new TermQuery(term2);
//		BooleanQuery booleanQuery=new BooleanQuery();
//		booleanQuery.add(termQuery1, Occur.MUST);
//		booleanQuery.add(termQuery2, Occur.MUST);
////		IndexSearcher searcher=new IndexSearcher(reader);
////		TopDocs topDocs=searcher.search(booleanQuery, 5);
////		ScoreDoc[] scoreDocs=topDocs.scoreDocs;
////        System.out.println("查询结果总数----"+topDocs.totalHits);
////        for(int i=0;i<scoreDocs.length;i++){
////    		int doc=scoreDocs[i].doc;
////    		Document document=searcher.doc(doc);
////    		System.out.println("type===="+document.get("type"));
////    	}
////    	reader.close();
//		writer.deleteDocuments(booleanQuery);
//		writer.close();
//	}
//}
