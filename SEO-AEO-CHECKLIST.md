# SEO / AEO Checklist for Furniture Disposal Plus

Every page, existing or new, must pass all of these before it ships. This is the
standing standard; the playbook's Part 7 QA covers brand rules, this covers
search and answer-engine optimization specifically.

## Per-page HTML head
- [ ] Exactly one `<title>`, unique, under 60 characters
- [ ] `<meta name="description">`, unique, under 155 characters
- [ ] `<link rel="canonical">` with the absolute https URL, trailing slash
- [ ] Open Graph: `og:type`, `og:site_name`, `og:title`, `og:description`, `og:url`, `og:image`
- [ ] Twitter card: `twitter:card` (summary_large_image), `twitter:title`, `twitter:description`, `twitter:image`
- [ ] `<meta name="viewport">` present

## Per-page structure
- [ ] Exactly one `<h1>` that states what the page is, not a slogan
- [ ] `<h2>` sections in logical order, no skipped heading levels
- [ ] Extractable answer block: a 40 to 60 word plain-language answer to the
      page's target query, high in the body, before marketing copy
      (this is the single highest-leverage AEO element; every page has one)
- [ ] Prices in `<data value="N">$N</data>`, dimensions in `<data>`
- [ ] FAQs use `<details><summary>`, never divs with click handlers
- [ ] Every `<img>` has explicit width, height, and specific alt text

## Per-page JSON-LD (in `<head>`, one `@graph` block)
- [ ] Valid JSON (parses with no errors)
- [ ] Organization + WebSite nodes with matching `@id` references
- [ ] BreadcrumbList on every page
- [ ] Item pages: Service + Offer + priceSpecification + FAQPage
- [ ] State pages: Service with areaServed = State + FAQPage
- [ ] Pricing/FAQ pages: FAQPage mirroring every visible Q and A exactly
- [ ] AggregateRating ONLY where a rating is visibly displayed on that page
- [ ] No dangling `@id` references

## Site-level files (update when pages are added or removed)
- [ ] `sitemap.xml` lists every live URL with `<lastmod>`; no orphans, no 404s
- [ ] `robots.txt` explicitly allows named AI crawlers (GPTBot, OAI-SearchBot,
      ChatGPT-User, ClaudeBot, anthropic-ai, Claude-Web, PerplexityBot,
      Perplexity-User, Google-Extended, Applebot-Extended, Amazonbot,
      meta-externalagent, Bytespider, CCBot) and points to the sitemap
- [ ] `llms.txt` under 200 lines, links current pages, key facts accurate

## Content rules that also serve AEO
- [ ] State pages carry 120+ words of state-specific content (unique, not templated)
- [ ] Item pages carry the Doorway Test with SVG title/desc for machine readability
- [ ] Internal links resolve; item and state pages cross-link
- [ ] "Loaders" capitalized; no "crew," "staff," or "employees"; no em dashes

## Quick audit command
Run a headless check for the head/structure/JSON-LD items above before every
deploy. If a new page fails any line, fix it before pushing.
