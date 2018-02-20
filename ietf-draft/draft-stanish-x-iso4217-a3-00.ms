.\"
.\"
.\"     David M. Meyer
.\"     dmm@1-4-5.net
.\"     
.\"     
.\"     Fill in Author?, -abc, category, ...
.\"
.\"
.\"     $Header: /home/dmm/SDOs/IETF/Drafts/generic_draft/RCS/draft-ietf-abc.ms,v 1.19 2004/09/28 13:50:35 dmm Exp $
.\"
.\"
.\"
.so tmac.id
.tl 'INTERNET-DRAFT''Walter Stanish'
.tl 'Intended status: Informational''The IFEX Project'
.tl 'Expires: \*[*XP]''ifex-project.org'
.tl '''\*(MO \n[*xyear]'
.LP
.ce 2
Registry of Unofficial Extensions to the ISO 4217 Alpha Three Currency Identification Namespace (X-ISO4217-A3)
draft-stanish-x-iso4217-a3-00

.LP
.B Abstract
.LP
.in 3

This document defines a new IANA registry to keep track of
identifiers for currencies or currency-like commodities lying
outside the traditional scope of the International Organization
for Standardization (ISO) 4217 alpha-3 standard, such as digital 
currencies and commodities, currencies issued by countries 
(nation-states) with limited international recognition, 
emerging commodities such as emissions reduction credits,
private or commercial currencies, and accounting units for 
local exchange and trading systems (LETS).  Such codes are 
already in use; the registry simply codifies their existence.

.IDBOILER "i"

.COPYSTATEMENT

.LP
.KS

.LP
.MH 1 Introduction
.LP
.in 3

The vast majority of multicurrency financial systems today use the
International Organization for Standardization (ISO) 4217 standard for
currency identification, which provides three digit numeric and three letter
("alpha-3") codepoints for the identification of each currency.
The latter, letter-based codes are in far greater use.

ISO4217 codepoints are registered by the International Organization for
Standardization through the maintenance agency for the registry, SIX 
Interbank Clearing [SIX], a Swiss financial body.

The specific terms of SIX or the ISO's mandate within the currency sphere
do not appear to be publicly available.  However, given that geographically
defined nation-states with some international recognition and physically
circulating currency (such as Transnistria [PRB]) have not been issued
currency codes, and leaving aside the relatively large scope for raising
conflict of interest questions with regards to SIX's SWIFT links, it is 
reasonable to assume that SIX and the ISO's mandate and/or sphere of 
interest in the currency domain is highly unlikely to suddenly extend 
to emerging currency-like commodities lacking some or all of the 
political qualities exhibited by conventional currencies.

At present, issued codepoints are almost exclusively linked to national
or supra-national entities (eg. 'EUR' for the Euro, the currency of the
European Union) that have achieved political recognition from the 
United Nations, with some exceptions for the more popular traditional
commodities, such as gold, and various regional instruments backed by
similar political entities.

This is understandable, given that conventional definitions of the
term 'currency' are often inextricably linked to the notion of
national issue by 'countries' or nation-states:

      "a system of money in general use in a particular country"
        -- The Oxford Dictionary [OXFORD]

Therefore currencies and currency-like commodities with far smaller 
circulation not adopting a traditional national paradigm of issue
are unlikely to be granted a codepoint. Indeed, there is some evidence
that SIX Interbank Clearing has rejected proposals for such registrations
in the recent past, citing lack of a national entity backing a particular
currency. [ISO-REJECTION]

This situation has left both end users and system developers and 
integrators in a quandry; in response they have apparently near uniformly 
opted to respond by issuing unofficial ISO4217 alpha-3 codes for private
use.

The present problem is that, given the recent growth of such unofficial
codes, and the increasing exchange of such assets across disparate
systems, no registry of unofficial codepoints exists.  Therefore no 
unambiguous, internet-wide, shared vocabulary can be adopted by 
internet systems to identify this emerging class of assets.

This document proposes the establishment of a registry to be maintained
by the Internet Assigned Numbers Authority (IANA) in order to resolve this
issue by creating an unofficial, parallel namespace codifying such 
unofficial extensions to the ISO4217 alpha-3 official standard,
tracking present and future unofficial assignments.

Examples of currencies or currency-like commodities for which systems may
benefit from such registration include decentralized digital currencies
such as Bitcoin [BITCOIN], the upcoming Ripple Credit [XRP], private 
currency systems [SLL], and regional currencies of limited political
recognition [PRB] [TEM].

.RFC2119

.KE
.LP
.bp
.TOCP
.bp

.LP
.MH 1 "X-ISO4217-A3"
.LP
.in 3

The official [ISO4217] codepoints are considered a subset of a larger 
namespace providing unambiguous identification of currencies and
currency-like commodities both within conventional ISO4217 assignment,
and codepoints external to that registry in popular use, the 
registry of which is to be managed by IANA.  This goal is achieved by
providing a longer machine format for codepoints, whilst respecting 
existing end user expectations regarding format and presentation.

As a result, systems implementers can provide X-ISO4217-A3 support and
be safe in the knowledge that they will have the capacity to support
all ISO4217 alpha-3 codepoints.

.MH 2 "Examples"

The Euro is encoded as '0EUR'.

The digital currency or currency-like commodity known as Bitcoin is
encoded as 'XBTC'.

.MH 2 "Source Registry Identification"
.in 3

In order to issue superset-compatible currency and currency-like commodity
identifiers within the [ISO4217] scheme, a prefix character is introduced
denominating the source registry, being either this IANA-managed and
unofficial registry (denoted with 'X') or the official ISO-managed registry
(denoted with '0').

The 'X' notation is chosen as is the standard semantic for unofficial 
extensions within internet drafts.  The '0' notation is chosen as implying
an 'initial' or 'original' semantic (with the useful side-effect of 
top-sort behaviour thus resulting).

.MH 2 "Codepoint Identification"
.in 3

The X-ISO4217-A3 format may be expressed in ABNF [RFC5234] as follows:

 codepoint    = registry a3code       ; eg: '0EUR', 'XBTC'

 registry     = reg-iso / reg-iana    ; ie: '0' / capital 'X'
 reg-iso      = "0"                   ; ISO4217-A3 (ISO managed)
 reg-iana     = %d88                  ; X-ISO4217-A3 (IANA managed)

 a3code       = 3caps-letter          ; eg: 'EUR', 'BTC'

 caps-letter  = %d65 / %d66 / %d67 / %d68 / %d69 / %d70 / %d71 / 
                %d72 / %d73 / %d74 / %d75 / %d76 / %d77 / %d78 / 
                %d79 / %d80 / %d81 / %d82 / %d83 / %d84 / %d85 /
                %d86 / %d87 / %d88 / %d89 / %d90   ; ie. capital A-Z


An explanation of the major elements follows.

codepoint:
  A structurally valid X-ISO4217-A3 codepoint in machine format, ie.
  including the registry identifier.

registry:
  A character identifying the source registry of the subsequent 'a3code'
  being either 'X' (denoting this registry, managed by IANA) or '0'
  (denoting the official ISO4217 registry, managed by SIX on behalf of
  the ISO).

a3code:
  Alpha-three code. A three letter alphanumeric string identifying a 
  specific currency or currency-like commodity within the prior
  'registry', as presently used within ISO4217 and unofficial extensions
  to the ISO4217 system, for example: 'EUR' (official ISO code denoting
  the Euro) or 'BTC' (widely used code denoting Bitcoin [BITCOIN]).

.LP
.MH 1 "Implementation Considerations"

.MH 2 "Machine Presentation"
.LP
.in 3

In contrast to the existing practice of utilising ad-hoc vocabularies
for systems integration, X-ISO4217-A3 systems MUST provide the full 
X-ISO4217-A3 code including registry identifier to all connecting systems.

.MH 2 "End User Presentation"
.LP
.in 3

For user presentation purposes, systems MAY wish to present the 'a3code' 
element to end users rather than the full X-ISO4217-A3 codepoint
(eg: 'BTC' instead of 'XBTC').  In such cases, adequate context
SHOULD be given in order to prevent ambiguity.  Adeqaute context
MAY include the option to view the full X-ISO4217-A3 codepoint,
the human language currency name, and the source registry, 
AND/OR the reconfirmation of any initiated operation with such
clarifying contextual information added prior to its actual
execution.

.MH 2 "Input"
.in 3

Implementations SHOULD accept both X-ISO4217-A3 and ISO4217-A3 equally 
in all cases, such that end users are NOT aware of any difference between
the two standards.

In the event that users provide an 'a3code' as input, multiple codepointrs The determination of 

.MH 2 "Case Sensitivity"
.in 3

Implementations MAY accept (structurally invalid) mixed or lower case
input, but SHOULD normalize this input to (structurally valid) upper
case prior to processing or storage.  For relevant security 
considerations, see Case Normalization.

Implementations MUST present only upper case normalized (structurally
valid) identifiers to both peer systems and end users.

.MH 2 "Internationalization"
.in 3

The registry MAY include currency and entity names as arbitrary UTF8 strings.

To aid international recognition of individual codepoints, 
implementations MUST present only upper case normalized (structurally
valid) identifiers to both peer systems and end users.  
(See Case Sensitivity).

.MH 1 "Security Considerations"
.in 3

X-ISO4217-A3 only provides a currency or currency-like commodity
identification scheme and DOES NOT approach problems of 
communications security, which are purposefully left to other 
protocols.  Even so, some security considerations are are 
pertinent.

.MH 2 "Input"
.in 3

.MH 3 "Input Confirmation"
.in 3

Because there is always some scope for error in systems 
requiring end user input (see Case Normalization), unambiguous 
confirmation of input SHOULD be provided.  Such confirmation 
MAY include the full X-ISO4217-A3 codepoint, the human 
language currency name, and the source registry.

.MH 3 "Case Normalization"
.in 3

It should be noted with regards to case normalization that some 
frequency of manual recognition or transposition errors is likely 
to occur whenever input is sought.  This frequency increases in
situations where an end user does not have linguistic or other
types of clues regarding a source document's probable vocabulary
or semantics, or is simply unfamiliar with the material.  
Machine-style codes, such as X-ISO4217-A3, therefore fall in to a
relatively high risk area, albiet one that conventional ISO4217
systems are also vulnerable to.

When considering the implementation of X-ISO4217-A3 systems that
accept lower or mixed-case input, implementers SHOULD consider
carefully whether case normalization is an appropriate choice
for their systems, given that the scope for such errors is 
nominally (though not hugely) increased.  (For example, an input
of 'Z' could come from a user misunderstanding a lowercase 'r',
or an input of 'U' could come from a user misunderstanding a
lowercase 'a'.)  To some extent this issue SHOULD be mitigated
by the requirement that implementations MUST present only 
upper case (structurally valid) codepoints both to peer systems
and end users.

.MH 2 "IANA Processes"
.in 3

IANA MUST provide adequate authentication of registrant institution 
communications in order to prevent the subversion of established
institutions' registration information via IANA's registrar functions.

.LP
.MH 1 "IANA Considerations"
.MH 2 "Name Space Exhaustion"
.in 3

Should the entire IANA-managed portion of the X-ISO4217-A3 namespace 
approach registration, IANA MUST immediately select an additional 
registry prefix.

.MH 2 "Registration"
.in 3

Codepoints MUST be assigned by IANA on a first come first served 
basis [RFC5226].  To support innovation, in contrast to conventional 
financial registries, codepoints MUST be issued to ANY registrant
supplying a valid domain name and reasonable information.

Registrants MUST provide the domain name with which their service is 
primarily associated AND the name of the registrant (either a person 
or an organizational entity), as well as the appropriate contents
for the registry fields.

Registrants MAY request a specific codepoint, or IANA MAY assign
them one.

.MH 2 "Modification / Cancellation"
.in 3

Due to the nature of currency and currency-like commodity 
identification between disparate financial systems, codepoint 
allocations are permanent and binding.  However, modifications to
metadata are possible and SHOULD be effected by IANA within a
few working days.  IANA should update the 'modified' field of the
registry entry in question to reflect the fact that modification
has taken place.

.MH 2 "Publication"

IANA SHALL publish revisions to the global registry of X-ISO4217-A3
codes as changes are made.

IANA SHALL NOT include ISO4217 official codepoints for legal reasons.

IANA SHALL provide GPG-compatible cryptographic signatures along with 
each version of the registry.  IANA MAY provide additional 
cryptographic signatures and/or checksums at their sole discretion.

The registry SHALL utilize UTF8 encoding in order to meet
internationalization requirements for institution names.

The format and initial contents of this registry document are specified
in Appendix A.

.MH 2 "ISO Liason"
.in 3

IANA SHOULD formally notify [SIX] (as the maintenance agency of the ISO4217
registry) of the existence of this registry.  IANA SHOULD make [SIX] 
feel welcome to forward parties unsuccessful in their applications for
ISO4217 codepoints to IANA, in order to acquire alternate codepoint 
registrations within the IANA-managed X-ISO4217-A3 registry.

.MH 2 "Security"
.in 3

IANA MUST provide adequate authentication of registrant institution
communications in order to prevent the subversion of established
codepoints' metadata via IANA's registrar functions.

As IANA is likely to have superior experience in this domain, specific
procedures are left to IANA's judgement.

.bp
.LP
.MH 1 "References"
.MH 2 "Normative References"
.LP
.in 3

[ISO4217]       ISO. "ISO 4217 - Currency Codes", 
                http://www.iso.org/iso/home/standards/
                 currency_codes.htm

[RFC2119]       Bradner, S., "Key words for use in RFCs to
                Indicate Requirement Levels", BCP 14, RFC 2119,
                March 1997.  

[RFC5226]       Narten, T., and H. Alvestrand, "Guidelines for
                Writing an IANA Considerations Section in RFCs",
                BCP 26, RFC 5226, May 2008.

[RFC5234]       Crocker, D. and P. Overell, "Augmented BNF for
                Syntax Specifications: ABNF", STD 68, RFC 5234,
                January 2008.

.fi

.bp

.LP
.MH 2 "Informative References"
.LP
.in 3

[BITCOIN]       Nakamoto, S., "Bitcoin: A Peer-to-Peer Electronic
                Cash System", 2009-05-24.
                http://www.bitcoin.org/bitcoin.pdf

[ISO-REJECTION] grossdigitalproduct, "getting BTC into ISO 4217 
                currency list", 10 November 2012.
                 https://bitcointalk.org/index.php?topic=123600
                 Relevant excerpt:
                  "I also understand you have previously denied 
                   such requests with the following statements:
                    1. The currency code is not linked to any 
                       country code.
                    2. The currency code is considered a 
                       'private currency' and not used for
                       tender in any country.
                    3. There will be no international payments
                       denominated in Bitcoin therefore an ISO
                       currency code for the Bitcoin is not
                       applicable.
                    4. The Institution responsible for the 
                       Bitcoin does not appear to be recognized
                       internationally or have any official 
                       status. Neither Reuters or Bloomberg 
                       provides market data related to its use."

[OXFORD]        Oxford University Press, "Definition of currency"
                http://oxforddictionaries.com/definition/english/
                 currency

[PRB]           Trans-Dniester Republican Bank, "History of coins 
                and banknotes". Retrieved November, 2012.
                http://www.cbpmr.net/?id=33&lang=en

[SIX]           SIX Interbank Clearing
                http://www.six-interbank-clearing.com/

[SLL]           "Economy of Second Life"
                http://en.wikipedia.org/wiki/Economy_of_Second_Life

[TEM]           Exchange and Solidarity Network of Magnesia, 
                "Alternate Monetary Unit"
                http://www.tem-magnisia.gr/

[XRP]           OpenCoin, Inc. "Ripple open source payment system"
                http://ripple.com/

.fi

.LP
.MH 1 "Acknowledgments"
.LP
.in 3

 * Payward, Inc. funded the research and development of this document.
 * OpenCoin, Inc. provided valuable feedback.
 * The (completely OMC unaffiliated) OpenSimulator project staff were 
   helpful in clarifiying the origin and status of OMC.

.MH 1 "Authors' Addresses"
.LP
.in 3

Prepared by Walter Stanish <walter@stani.sh> of Payward, Inc. on 
behalf of The Internet Financial EXchange (IFEX) Project: 
http://www.ifex-project.org/

.bp

.MH 1 "Appendix A: Initial Registry Contents"

Prior to IANA handover, parties wishing to acquire an identifier may do
so by contacting the IFEX Project via ifex-project.org

.PP
.in 0
 # X-ISO4217-A3: Unofficial ISO4217 Alpha-3 Extensions Registry.
 #
 # Version: 20121113-0
 #  (Format is <yyyy><mm><dd>-<x>, where x is a digit from 0-9)
 #
 # To be cryptographically signed by IANA and replicated freely.
 #
 # Format:
 #  - Lines beginning with '#' are comments.
 #  - Whitespace should be ignored.
 #  - Fields at the end of a record may be absent.
 #  - Records are comprised of the following fields (ABNF):
 #     country-code institution-code "|" created "|" modififed \\
 #       "|" domain "|" registrant "|" fingerprint
 #
 # Fields:
 #  registry       Registry of origin. 'X' denotes IANA X-ISO4217-A3.
 #  a3code         Three character code identifying the currency or
 #                 currency-like commodity within a registry.
 #  name-singular  Singular form name of the currency (or primary unit)
 #  e              Number of post-decimal digits in normal use.
 #  created        Date of registration (YYYY-MM-DD).
 #  modified       Date last modified (YYYY-MM-DD), or blank.
 #  domain         Primary domain name associated with the record.
 #  registrant     Native language name of the registrant (UTF8).
 X|ACD|Avination Care Dollar|2|2012-11-13||avination.com|Avination Virtual Limited
 X|BTC|Bitcoin|8|2012-11-13||bitcoin.org|Bitcoin Community
 X|CER|Kyoto Protocol Certified Emissions Reduction CO2 Tonne|4|2012-11-13|||United Nations Framework Convention on Climate Change
 X|OMC|Open Metaverse Currency|2|2012-11-13||Open Metaverse Currency Community
 X|PRB|Transistrian Ruble|0|2012-11-13||cbpmr.net|Trans-Dniester Republican Bank
 X|SLL|Second Life Linden Dollar|0|2012-11-13||secondlife.com|Linden Research, Inc.
 X|TEM|Volos Alternative Monetary Unit|0|2012-11-13||tem-magnesia.gr|Volos Alternative Monetary Unit Community
 X|VER|Non Kyoto Protocol Verified Emissions Reduction CO2 Tonne|4|2012-11-13|||Non Kyoto Protocol Verified Emissions Reduction Community
 X|XRP|Ripple Credit|6|2012-11-13||ripple.com|OpenCoin Inc.

.bp

.MH 1 "Appendix B: Document History"

draft-stanish-x-iso4217-a3-00 (2012-11-13)
  Initial release.

.DE
.COPYFULL
