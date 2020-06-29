/* author: ETH Zurich, gta digital, Zoé Reinke
        license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/XSLT) */

import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;



public class XsltTransformer {
    public static void main(String[] args) throws IOException, URISyntaxException, TransformerException {
            String xmlFile = "/home/matteolorenzini/GTARepo/ProfileParser/Profiles/Place/fake-canton-annotated-example_v2_20200629.xml"; //put path of input XML file between ""
            String xslFile = "/home/matteolorenzini/GTARepo/ProfileParser/Profiles/Place/Place.xsl"; //put path of input XSL file between ""
            TransformerFactory factory = TransformerFactory.newInstance();
            Source xslt = new StreamSource(new File(xslFile));
            Transformer transformer = factory.newTransformer(xslt);
            Source text = new StreamSource(new File(xmlFile));
            transformer.transform(text, new StreamResult(new File("/home/matteolorenzini/GTARepo/ProfileParser/Profiles/Place/target_new_v2.xml"))); //put path of newly created XML file between ""
    }
}
