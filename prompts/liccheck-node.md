# License Compliance Check for Node.js Projects

**Complete License Compliance Check for Node.js Projects**

Run this command in any Node.js project directory to check all dependencies against Amazon's approved/prohibited license lists:

```bash
find . -name "package.json" -type f | grep -v node_modules | grep -v "\.venv" | head -1 | xargs -I {} dirname {} | xargs -I {} sh -c 'cd {} && echo "y" | npx license-checker --json | awk '\''
/"[^"]+": {/ {
    if (match($0, /"([^"]+)": \{/, arr)) {
        full_package = arr[1]
        if (match(full_package, /^(.+)@([^@]+)$/, parts)) {
            package_name = parts[1]
            version = parts[2]
        } else {
            package_name = full_package
            version = "N/A"
        }
        
        for (i = 0; i < 5; i++) {
            if ((getline nextline) > 0) {
                if (match(nextline, /"licenses": "([^"]+)"/, lic_arr)) {
                    license = lic_arr[1]
                    norm = tolower(license)
                    
                    # Amazon Pre-approved licenses
                    status = "Not Pre-approved"
                    if (license ~ /^MIT$|^ISC$|^Apache-2\.0$|^Apache v 2\.0$|^Apache v1\.1$/) status = "✅ Pre-approved"
                    if (license ~ /^BSD|BSD-2-Clause|BSD-3-Clause/) status = "✅ Pre-approved"
                    if (license ~ /CC-BY|CC0|Creative Commons/) status = "✅ Pre-approved"
                    if (license ~ /\(MIT OR|MIT OR CC0/) status = "✅ Pre-approved"
                    if (norm ~ /academic free license|antlr|amazon software|artistic|boost|carnegie mellon|code project|curl|eiffel|freetype|imagemagick|indiana university|jpeg|jibx|jmock|json|jython|libtiff|microsoft public|mulan psl|mx4j|nsis|openldap|openssl|pddl|pdwiki|php|postgresql|python software foundation|ruby|scala|sil open font|slf4j|sqlite|standard ml|tcl\/tk|university of illinois|unlicense|vim|w3c|wordnet|wtfpl|zlib|zope/) status = "✅ Pre-approved"
                    
                    # Prohibited licenses
                    if (license ~ /AGPL|GNU AGPL|Affero/) status = "❌Prohibited"
                    if (license ~ /GPL/ && license !~ /MIT OR GPL/) status = "❌Prohibited"
                    if (license ~ /LGPL|GNU LGPL/) status = "❌Prohibited"
                    if (license ~ /SSPL|Server Side Public/) status = "❌Prohibited"
                    if (norm ~ /apple public source|cdla|cpal|enna|eupl|european union public|honest public|nasa open source|odbl|open data commons|osl|open software license|parity license|realnetworks|busl|business source|commons clause|confluent community|cc-nc|elastic license|hugging face|prosperity license|redis source/) status = "❌Prohibited"
                    
                    print "| " package_name " | " version " | " license " | " status " |"
                    break
                }
            }
        }
    }
}

BEGIN {
    print "| Library Name | Version | License | Status |"
    print "|--------------|---------|---------|--------|"
}'\'' | sort'
```

## Expected Output

Table with columns: Library Name, Version, License, Status

**Status Values:**
- **Pre-approved**: Compliant with Amazon's approved license list
- **Not Pre-approved**: Requires manual review
- **Prohibited**: Violates Amazon's license policy

## Coverage

**Pre-approved licenses include:**
- MIT, ISC, Apache variants, BSD variants
- Creative Commons (CC-BY, CC0)
- Academic Free License, Artistic License, Boost
- PostgreSQL, Python Software Foundation, Ruby, Scala
- SQLite, Unlicense, W3C, Zlib, and 40+ others

**Prohibited licenses include:**
- GPL family (GPL, AGPL, LGPL)
- SSPL, Apple Public Source, EUPL
- Business Source License, Elastic License
- Commons Clause, and 20+ others

## Usage

1. Navigate to any Node.js project root directory
2. Copy-paste the command above
3. Review results for compliance status
4. Address any "Prohibited" or "Not Pre-approved" packages
