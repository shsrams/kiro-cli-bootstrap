# License Compliance Check Prompt

I need to verify that my Python project dependencies comply with approved third-party licenses. Please perform the following steps:

1. **Export dependencies**: Run `uv export --format requirements.txt --output-file requirements-liccheck.txt`

2. **Add license checking tools**: Add `liccheck>=0.9.2`, `setuptools>=70.0.0`, and `pip>=24.0` to dev dependencies in pyproject.toml

**Note**: Skip running `uv sync` after updating pyproject.toml - the next `uv run liccheck` command will automatically install the required dependencies.

3. **Create license configuration**: Create `liccheck.ini` with this content:

```ini
[Licenses]
authorized_licenses:
    academic free license v.2.1
    academic free license v.3.0
    antlr 2 public domain statement
    amazon software license
    apache v1.1
    apache v 2.0
    apache license v2.0 with llvm exceptions
    applejavaextensions
    the artistic license 1.0
    the artistic license 1.0 (perl)
    boost
    bsd licenses
    bsd
    new bsd
    zero-clause bsd
    2-clause bsd
    2-clause bsd + patents
    3-clause bsd
    carnegie mellon dictionary license
    code project open license 1.02
    creative commons attribution 2.0
    creative commons attribution 2.5
    creative commons attribution 3.0
    creative commons attribution 4.0
    cc-by
    creative commons copyright-only dedication
    creative commons 1.0 universal
    cc0
    curl
    eiffel forum license 2.0
    free type license
    historical permission notice and disclaimer - sell variant
    imagemagick license
    indiana university extreme! lab software license v 1.1.1
    isc license
    jpeg license
    java html - jtidy license
    jibx
    jmock
    json
    jython
    libtiff license
    microsoft public license
    the mit license
    mit
    x11
    expat
    icu
    mit-cmu
    python imaging library
    pil
    mulan psl 2.0
    mx4j license
    nsis
    openldap public license
    openssl license
    pddl license
    pdwiki: license
    php license
    postgresql license
    python software foundation license v 2.0
    python software foundation license v 2.1.1
    ruby
    scala license
    sil open font license
    slf4j
    sqlite
    standard ml of new jersey
    tcl/tk
    university of illinois/ncsa open source license
    unlicense
    vim license
    w3c license
    wordnet 3.0 license
    wtfpl
    stdstring 100%% free
    zlib/libpng license
    zope public license 2.1

unauthorized_licenses:
    affero general public license (agpl) 1.0
    affero general public license (gnu agpl) 3.0
    apple public source license 2.0
    community data license agreement (cdla) - sharing 1.0
    common public attribution license version (cpal) 1.0
    enna license (mit variant)
    european union public license (eupl) 1.1
    european union public license (eupl) 1.2
    gnu lesser general public license (gnu lgpl) 3.0
    gnu general public license (gnu gpl) 3.0
    honest public license (hpl) 1.0
    nasa open source agreement 1.3
    open data commons open database license (odbl)
    open software license (osl) 3.0
    parity license 7.0
    realnetworks public source license 1.0
    server side public license (sspl) 1.0
    business source license 1.1
    busl-1.1
    commons clause
    community research and academic programming license
    confluent community license
    creative commons attribution-noncommercial (cc-nc) 1.0
    creative commons attribution-noncommercial (cc-nc) 2.0
    creative commons attribution-noncommercial (cc-nc) 2.5
    creative commons attribution-noncommercial (cc-nc) 3.0
    creative commons attribution-noncommercial (cc-nc) 4.0
    elastic license
    hugging face optimized inference license 1.0
    hfoilv1.0
    prosperity license 3.0
    redis source available license agreement
    uc berkeley's standard copyright and disclaimer notice
    university of wisconsin web cache simulator license
```

4. **Run license check**: Execute `uv run liccheck -s liccheck.ini -r requirements-liccheck.txt`

5. **Analyze results**: Create a summary table with columns:
   - Library Name
   - Version  
   - License
   - Status (PRE-APPROVED/NOT PRE-APPROVED/PROHIBITED)
   - Notes

**Important**: `liccheck` uses exact string matching. When analyzing results, manually cross-reference reported licenses against the authorized/unauthorized lists using fuzzy matching to account for naming variations:

- "Apache Software" = "apache v 2.0" (authorized)
- "Apache-2.0" = "apache v 2.0" (authorized)
- "BSD-3-Clause" = "3-clause bsd" (authorized) 
- "ISC License (ISCL)" = "isc license" (authorized)
- "Python Software Foundation" = "python software foundation license v 2.0" (authorized)
- "License :: OSI Approved :: MIT" = "the mit license" (authorized)

Only flag licenses as truly NOT PRE-APPROVED if they don't match any authorized license pattern.

**Expected output**: A markdown table categorizing all dependencies as:
- ✅ **PRE-APPROVED** (matches authorized licenses, including fuzzy matches)
- ⚠️ **NOT PRE-APPROVED** (genuinely not in authorized list, not in unauthorized list)  
- ❌ **PROHIBITED** (matches unauthorized licenses)

Include a summary count of each category at the end.
