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

    XsltTransformer(final Path input, final Path output, final Transformer transformer) {
        this.input = input;
        this.output = output;
        this.transformer = transformer;
    }


    public static void main(final String[] args) throws Exception {

        final String source = "/Users/lomatteo/REPO/ProfileParser/Profiles/BuiltWorks/source_files/";
        final String target = "/Users/lomatteo/REPO/ProfileParser/Profiles/BuiltWorks/target_files";
        final String xsl = "/Users/lomatteo/REPO/ProfileParser/Profiles/BuiltWorks/built_works.xsl";

        final Transformer transformer = TransformerFactory.newInstance().newTransformer(new StreamSource(
                Paths.get(xsl).toFile()));

        new XsltTransformer(Paths.get(source),
                Paths.get(target), transformer)
                .run();

    }

    private Path transform(final Path file) {
        final StreamSource resource = new StreamSource(file.toFile());
        final Path output = this.resolveOutput(file);
        final Result result = new StreamResult(output.toFile());
        try {
            this.transformer.transform(resource, result);
            return output;
        } catch (final TransformerException ex) {
            throw new IllegalStateException(ex);
        }
    }

    private Path resolveOutput(final Path file) {
        return this.output.resolve(this.input.relativize(file));
    }

    public void run() throws IOException {
        Files.walk(this.input)
                .filter(file -> file.getFileName().toString().endsWith(".xml"))
                .map(this::transform)
                .forEach(System.out::println);
    }
}