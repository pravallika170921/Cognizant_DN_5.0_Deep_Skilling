import documents.Document;
import factories.DocumentFactory;
import factories.WordFactory;
import factories.PdfFactory;
import factories.ExcelFactory;

public class FactoryMethodDemo {

    public static void main(String[] args) {

        DocumentFactory wordFactory = new WordFactory();
        Document wordDoc = wordFactory.createDocument();
        wordDoc.open();

        DocumentFactory pdfFactory = new PdfFactory();
        Document pdfDoc = pdfFactory.createDocument();
        pdfDoc.open();

        DocumentFactory excelFactory = new ExcelFactory();
        Document excelDoc = excelFactory.createDocument();
        excelDoc.open();
    }
}