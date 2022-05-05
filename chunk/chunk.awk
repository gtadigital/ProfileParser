# Usage - replace "node" by your tag and run: $ awk -f split-xml.awk my.xml
/<entry/ {
        rfile="chunk_" count ".xml"
        print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > rfile
        print "<root>" > rfile
        print $0 > rfile
        getline
        while ($0 !~ "<\/entry>" ) {
                print > rfile
                getline
        }
        print $0 > rfile
        print "</root>" > rfile
        close(rfile)
        count++
}