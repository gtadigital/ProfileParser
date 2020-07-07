/* author: ETH Zurich, gta digital, Zoé Reinke, Matteo Lorenzini
license: please refer to the license.txt file in our git repository (https://github.com/gtadigital/XSLT) */

import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import java.io.IOException;
import java.nio.file.*;

public class XsltTransformer {
    private final Path input;
    private final Path output;
    private final Transformer transformer;

    XsltTransformer(Path input, Path output, Transformer transformer) {
        this.input = input;this.output = output;this.transformer = transformer;
    }

    public static void main(String[] args) throws Exception {
        final Transformer transformer = TransformerFactory
                .newInstance()
                .newTransformer(new StreamSource(Paths.get("/home/matteolorenzini/GTARepo/ProfileParser/Profiles/Place/Place.xsl").toFile()));
        new XsltTransformer(
                Paths.get("/home/matteolorenzini/GTARepo/ProfileParser/Profiles/Place/source_files"),
                Paths.get("/home/matteolorenzini/GTARepo/ProfileParser/Profiles/Place/target_files"),
                transformer
        ).run();
    }

    private Path transform(Path file) {
        final StreamSource resource = new StreamSource(file.toFile());
        final Path output = this.resolveOutput(file);
        final Result result = new StreamResult(
                output.toFile()
        );
        try {
            this.transformer.transform(resource, result);
            return output;
        } catch (TransformerException ex) {
            throw new IllegalStateException(ex);
        }
    }

    private Path resolveOutput(Path file) {
        return this.output.resolve(this.input.relativize(file));
    }

    public void run() throws IOException {
        Files.walk(this.input)
                .filter(file -> file.getFileName().toString().endsWith(".xml"))
                .map(this::transform)
                .forEach(System.out::println);
    }
}