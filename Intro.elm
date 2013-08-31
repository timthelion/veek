module Intro where
{-
GPL 3.0 - Timothy Hobbs <timothyhobbs@seznam.cz>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, version 3 of the License.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
-}

import Window
import Time
import Graphics.Input as Input
import Keyboard
import Char
import Nav

eek = text $ bold $ toText "eek!"

textHeight = heightOf eek
veekHeight = round $ (toFloat textHeight)*1.5
veekWidth = textHeight

veekVertexes f =
 (if | f == 0    -> [] 
     | f == 1    -> [(0-(veekWidth `div` 4),0-(veekHeight `div` 2))]
     | otherwise -> [(0-(veekWidth `div` 4),0-(veekHeight `div` 2))
                    ]) -- ,(0,0-(textHeight `div` 2))])
 ++[(0-(veekWidth `div` 2),0-(textHeight `div` 2))
 ,(0,textHeight `div` 2)
 ,((veekWidth `div` 2),0-(textHeight `div` 2))]++
 (if | f == 0    -> []
     | f == 1    -> [(veekWidth `div` 4,0-(veekHeight `div` 2))]
     | otherwise -> [(veekWidth `div` 4,0-(veekHeight `div` 2))
                    ,(0,0-(textHeight `div` 3))])

veekOutline f = path (veekVertexes f)

veekV f =
 if | f < 3 -> traced (solid black) (veekOutline f)
    | otherwise -> filled red $ polygon (veekVertexes f)

v f = collage veekWidth veekHeight [veekV f]

veek f = flow right [v f,eek]
vs = plainText "    vs"
exams = plainText "The Comprehensive Exams"
usage = [markdown|

Welcome to Veek!  Veek! is an educational game made to prepare you for the Charles University KAJL Bachelors Comprehensive Exams.

Veek is a robot designed by the grand Über-European Educational Committee for Progress Development Social Perfection Equality Democracy and Agricultural Fairness(ÜEECPDSPEDAF for short).  Veek's mission is to retrieve particles of knowledge from the endless caverns of doom.

Every level you will take a journey with Veek through the cavern of doom.  You will be presented with a set of questions and you'll have to collect particles in order to answer them.

Here's an example question. "When discussing word formation 'lubritection' is a _ _ _ _ _".  The correct answer is "blend".

The game is a bit of a mixture of hangman and pacman.  Veek! needs to eat the correct particles(letters) and avoid ones that don't belong.

Navigation is simple, just use the arrow keys.

Good luck!

|]

levelLinks = flow down [[markdown|

## Levels

### Introduction to Language (ÚJAZ)

Human language

 - [Read lesson](UJAZ/HumanLanguageIntro.html)
 - [Play level](UJAZ/HumanLanguage.html)

Language history and geography

 - [Read lesson](UJAZ/HistoryAndGeographyIntro.html)
 - [Play level](UJAZ/HistoryAndGeography.html)

The study of language as a science, PLC

 - [Read lesson](UJAZ/LinguisticsIntro.html)
 - [Play level](UJAZ/Linguistics.html)

Language typology: Isolating vs Inflective

 - [Read lesson](UJAZ/IsolatingInflectiveIntro.html)
 - [Play level](UJAZ/IsolatingInflective.html)

The semiotic triangle

 - [Read lesson](UJAZ/SemioticTriangleIntro.html)
 - [Play level](UJAZ/SemioticTriangle.html)

Langue and Parole

 - [Read lesson](UJAZ/SaussureIntro.html)
 - [Play level](UJAZ/Saussure.html)

### Written language

Basic terminology

 - [Read lesson](Writing/BasicTermsIntro.html)
 - [Play level](Writing/BasicTerms.html)

Historic and present day writing sysems

 - [Read lesson](Writing/WritingSystemsIntro.html)
 - [Play level](Writing/WritingSystems.html)
|]

{- ### Sounds - Phonetics and Phonology

Other resources:

 - [Kevin Russell´s resources on phonetics](http://home.cc.umanitoba.ca/~krussll/phonetics/index.html)
 - [This site](http://www.uiowa.edu/~acadtech/phonetics/english/frameset.html)

Note: This unit focuses on US English not on RP!

Basic terms

 - [Read lesson](Phonetics/BasicTermsIntro.html)
 - [Play level](Phonetics/BasicTerms.html)

Phonemes found in the ten most frequent words

 - [Read lesson](Phonetics/FirstTenWordsIntro.html)
 - [Play level](Phonetics/FirstTenWords.html)

Plosives

 - [Read lesson](Phonetics/PlosivesIntro.html)
 - [Play level](Phonetics/Plosives.html)

Approximants

 - [Read lesson](Phonetics/ApproximantsIntro.html)
 - [Play level](Phonetics/Approximants.html)

Pure vowels

 - [Read lesson](Phonetics/PureVowelsIntro.html)
 - [Play level](Phonetics/PureVowels.html)

Fricatives

 - [Read lesson](Phonetics/FricativesIntro.html)
 - [Play level](Phonetics/Fricatives.html)

Affricates

 - [Read lesson](Phonetics/AffricatesIntro.html)
 - [Play level](Phonetics/Affricates.html)

Diphthongs and triphtongs

 - [Read lesson](Phonetics/DiphthongsIntro.html)
 - [Play level](Phonetics/Diphthongs.html)

Nasals

 - [Read lesson](Phonetics/NasalsIntro.html)
 - [Play level](Phonetics/Nasals.html)

Laterals

 - [Read lesson](Phonetics/LateralsIntro.html)
 - [Play level](Phonetics/Laterals.html)

Connected speech(linking, elision, juncture)

 - [Read lesson](ConnectedIntro.html)
 - [Play level](Connected.html)

Dentalization and darkness

 - [Read lesson](Phonetics/DarklIntro.html)
 - [Play level](Phonetics/Darkl.html)

Word stress

 - [Read lesson](Phonetics/WordStressIntro.html)
 - [Play level](Phonetics/WordStress.html)

Sentence stress

 - [Read lesson](Phonetics/SentenceStressIntro.html)
 - [Play level](Phonetics/SentenceStress.html)

Weak forms

 - [Read lesson](Phonetics/WeakFormsIntro.html)
 - [Play level](Phonetics/WeakForms.html)

Intonation

 - [Read lesson](Phonetics/IntonationIntro.html)
 - [Play level](Phonetics/Intonation.html)

This information on Phonetics and Phonology is taken in part from the Longman Pronunciation Dictionary, 3rd Edition by J.C.Wells, in part from Wikipedia/Wiktionary and in part from Mgr. Kristýna Poesová, Ph.D.'s note's. -}

 ,[markdown|

### Parts of words, origins of words - Lexicology

Basic terms

 - [Read lesson](Lexicology/BasicTermsIntro.html)
 - [Play level](Lexicology/BasicTerms.html)

Lexicography

 - [Read lesson](Lexicology/LexicographyIntro.html)
 - [Play level](Lexicology/Lexicography.html)

Word formation processes

 - [Read lesson](Lexicology/WordFormationIntro.html)
 - [Play level](Lexicology/WordFormation.html)

Changes in meaning over time

 - [Read lesson](Lexicology/ChangesIntro.html)
 - [Play level](Lexicology/Changes.html)

Paradigmatic sense relations

 - [Read lesson](Lexicology/RelationsIntro.html)
 - [Play level](Lexicology/Relations.html)

Meaning Transfer

 - [Read lesson](Lexicology/TransferIntro.html)
 - [Play level](Lexicology/Transfer.html)

Derivation: semantic classification of prefixes

 - [Read lesson](Lexicology/SemanticClassificationOfPrefixesIntro.html)
 - [Play level](Lexicology/SemanticClassificationOfPrefixes.html)

Compound words: Semantic classification

 - [Read lesson](Lexicology/SemanticClassificationOfCompoundsIntro.html)
 - [Play level](Lexicology/SemanticClassificationOfCompounds.html)

### Words and how they change in different places - Morphology

'The' and 'a': Articles

 - [Read lesson](Morphology/ArticlesIntro.html)
 - [Play level](Morphology/Articles.html)

People, places, things, abstract concepts: nouns

 - [Read lesson](Morphology/NounsIntro.html)

Noun cases

 - [Read lesson](Morphology/GenitiveNounsIntro.html)
 - [Play level](Morphology/GenitiveNouns.html)

His, her, its: Pronouns

 - [Read lesson](Morphology/PronounsIntro.html)
 - [Play level](Morphology/Pronouns.html)

Warm, purple, and fluffy: Adjectives

 - [Read lesson](Morphology/AdjectivesIntro.html)
 - [Play level](Morphology/Adjectives.html)

Quickly, quietly, and queerly: Adverbs

 - [Read lesson](Morphology/AdverbsIntro.html)

Eat, sleep, and poop: Verbs

 - [Read lesson](Morphology/VerbsIntro.html)

Ate, slept, and pooped: Tense

 - [Read lesson](Morphology/TenseIntro.html)
 - [Play level](Morphology/Tense.html)

Progressive perfection: Aspect

 - [Read lesson](Morphology/AspectIntro.html)
 - [Play level](Morphology/Aspect.html)

Mood

 - [Read lesson](Morphology/MoodIntro.html)

Voice

 - [Read lesson](Morphology/VoiceIntro.html)

Infinitive, Gerund, Participle

 - [Read lesson](Morphology/InfinitiveGerundParticipleIntro.html)
 - [Play level](Morphology/InfinitiveGerundParticiple.html)

Prepositions

 - [Read lesson](Morphology/PrepositionsIntro.html)
 - [Play level](Morphology/Prepositions.html)

Conjunctions

 - [Read lesson](Morphology/ConjunctionsIntro.html)
 - [Play level](Morphology/Conjunctions.html)

### Strings of words - Syntax

Sentence Types

 - [Read lesson](Syntax/SentenceTypesIntro.html)
 - [Play level](Syntax/SentenceTypes.html)

Question Types

 - [Read lesson](Syntax/QuestionTypesIntro.html)
 - [Play level](Syntax/QuestionTypes.html)

Clause Structure

 - [Read lesson](Syntax/ClauseStructureIntro.html)
 - [Play level](Syntax/ClauseStructure.html)

Subjects

 - [Read lesson](Syntax/SubjectsIntro.html)
 - [Play level](Syntax/Subjects.html)

Objects

 - [Read lesson](Syntax/ObjectsIntro.html)
 - [Play level](Syntax/Objects.html)

Adverbials

 - [Read lesson](Syntax/AdverbialsIntro.html)
 - [Play level](Syntax/Adverbials.html)

Appositions

 - [Read lesson](Syntax/AppositionsIntro.html)
 - [Play level](Syntax/Appositions.html)

It

 - [Read lesson](Syntax/ItIntro.html)
 - [Play level](Syntax/It.html)

Predicate Types

 - [Read lesson](Syntax/PredicateTypesIntro.html)
 - [Play level](Syntax/PredicateTypes.html)

Word Order - FSP

 - [Read lesson](Syntax/WordOrderIntro.html)
 - [Play level](Syntax/WordOrder.html)

Clause Types

 - [Read lesson](Syntax/ClauseTypesIntro.html)

Infinitive

 - [Read lesson](Syntax/InfinitiveIntro.html)
 - [Play level](Syntax/Infinitive.html)

The Gerund and the Participle

 - [Read lesson](Syntax/GerundAndParticipleIntro.html)
 - [Play level](Syntax/GerundAndParticiple.html)

Nominal Content Clauses

 - [Read lesson](Syntax/NominalContentClausesIntro.html)
 - [Play level](Syntax/NominalContentClauses.html)

Relative Clauses

 - [Read lesson](Syntax/RelativeClausesIntro.html)
 - [Play level](Syntax/RelativeClauses.html)

Speech and Thought

 - [Read lesson](Syntax/SpeechAndThoughtIntro.html)
 - [Play level](Syntax/SpeechAndThought.html)

Adverbial Clauses

 - [Read lesson](Syntax/AdverbialClausesIntro.html)
 - [Play level](Syntax/AdverbialClauses.html)

Semantic categorization of compound sentences

 - [Read lesson](Syntax/CompoundSentencesIntro.html)
 - [Play level](Syntax/CompoundSentences.html)


### British Literature

1. The characteristics of Anglo-Saxon poetry

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/The_characteristics_of_Anglo-Saxon_poetry)

2. Chaucer's contribution to the development of English Literature

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/Chaucer%27s_contribution_to_the_development_of_English_Literature)

3. The importance of theatre to the Elizabethan sensibility

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/The_importance_of_theatre_to_the_Elizabethan_sensibility)
 - [Play level](BritLit/ElizabethanSensibility.html)

4. Shakespeare's plays in the context of the late Renaissance (the Elizabethan period) and from the point of view of modern sensibility

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/Shakespeare%27s_comedies_in_the_context_of_the_late_Reniassance_(the_Elizabethan_period)_and_from_the_point_of_view_of_modern_sensibility)
 - [Play level](BritLit/ShakespearesComedies.html)

5. The Contrast in the sensibility of Elizabethan poetry and Metaphysical poetry

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/The_Contrast_in_the_sensibility_of_Elizabethan_poetry_and_Metaphysical_poetry)
 - [Play level](BritLit/ElizabethanAndMetaphysicalPoetry.html)

6. Paradise Lost as the major poetic work of the 17th century

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/Paradise_Lost_as_the_major_poetic_work_of_the_17th_century)

7. Characteristic features of English Neo-Classicism

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/Characteristic_features_of_English_Neo-Classicism)
 - [Play level](BritLit/NeoClassicism.html)

8. The rise and forms(types) of the 18th century English Novel

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/The_rise_and_forms(types)_of_the_18th_century_English_Novel)
 - [Play level](BritLit/Novel18th.html)

9. Sterne's Tristram Shandy as the 18th Century anti-novel and as a forerunner of the postmodern novel

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/Sterne%27s_Tristram_Shandy_as_the_18th_Century_anti-novel_and_as_a_forerunner_of_the_postmodern_novel)

10. The spirit and sensibility of pre-Romanticism and Romanticism

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/The_spirit_and_sensibility_of_pre-Romanticism_and_Romanticism)
 - [Play level](BritLit/Romanticism.html)

11. The different contributions of the Lake Poets to Romanticism

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/The_different_contributions_of_the_Lake_Poets_to_Romanticism)
 - [Play level](BritLit/LakePoets.html)

12. The varied conceptions of Romanticism in Byron, Shelley and Keats

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/The_varied_conceptions_of_Romanticism_in_Byron,_Shelley_and_Keats)

13. The typology of the Victorian novel

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/The_typology_of_the_Victorian_novel)
 - [Play level](BritLit/VictorianNovel.html)

14. The philosophical and Socio-historical background of Victorianism

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/The_philosophical_and_Socio-historical_background_of_Victorianism)

15. The sensibility of Victorian poetry with reference to at least one specific poem

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/The_sensibility_of_Victorian_poetry_with_reference_to_at_least_one_specific_poem)
 - [Play level](BritLit/VictorianPoetry.html)

16. Discuss the major features of British modernism including the Bloomsbury Group using the work of E.M. Forster, James Joyce (not 'Eveline') and V. Woolf to illustrate your discussion

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/Discuss_the_major_features_of_British_modernism_including_the_Bloomsbury_Group_using_the_work_of_E.M._Forster,_James_Joyce_(not_%27Eveline%27)_and_V._Woolf_to_illustrate_your_discussion)
 - [Play level](BritLit/BloomsburyGroup.html)

17. Ezra Pound, T.S. Elliot and British Modernist poetry

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/Ezra_Pound,_T.S._Elliot_and_British_Modernist_poetry)

18. D.H. Lawrence's position within modernism

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/D.H._Lawrence%27s_position_within_modernism)

19. The fiction and poetry of the 1930s

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/The_fiction_and_poetry_of_the_1930s)
 - [Play level](BritLit/FictionAndPoetry30s.html)

20. Discuss the 20th century British writers who focus on moral concerns(Joseph Conrad, Graham Greene, William Golding, Anthony Burgess, Iris Murdoch)

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/Discuss_the_20th_century_British_writers_who_fucus_on_moral_concers(Joseph_Conrad,_Graham_Greene,_William_Golding,_Anthony_Burgess,_Iris_Murdoch))
 - [Play level](BritLit/MoralConcerns.html)

21. Theatre of the absurd, with reference to Waiting for Godot

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/Theatre_of_the_absurd,_with_reference_to_Waiting_for_Godot)
 - [Play level](BritLit/TheatreOfAbsurd.html)

22. Movements in post WWII British poetry

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/Movements_in_post_WWII_British_poetry)
 - [Play level](BritLit/PostWWIIPoetry.html)

23. British fiction from the 1960s to 1980s and the philosophical background of Post-modernism

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/British_fiction_from_the_1960s_to_1980s_and_the_philosophical_background_of_postmodernism)
 - [Play level](BritLit/Fiction60s80s.html)

24. Major tendencies in British fiction from the 1990s to the present

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/Major_tendencies_in_British_fiction_from_the_1990s_to_the_present)
 - [Play level](BritLit/Fiction90sOnwards.html)

25. Multicultural literature in contemporary Britain

 - [Read lesson](http://britlitbernie2012.wikia.com/wiki/Multicultural_literature_in_contemporary_Britain)

### American Literature

1. The Colonial and Early American Period

 - [Read lesson](Amlit/ColonialIntro.html)
 - [Play level](Amlit/Colonial.html)

2. Romanticism I

 - [Read lesson](Amlit/RomanticismIIntro.html)
 - [Play level](Amlit/RomanticismI.html)

3. Romanticism II: Trancendentalism

 - [Read lesson](Amlit/RomanticismIIIntro.html)
 - [Play level](Amlit/RomanticismII.html)

4. Romanticism III: Transition period

 - [Read lesson](Amlit/RomanticismIIIIntro.html)
 - [Play level](Amlit/RomanticismIII.html)

5. Early American Realism/Naturalism

 - [Read lesson](Amlit/RealismIntro.html)
 - [Play level](Amlit/Realism.html)

6. AmericanPoetry of the 2nd half of the 19th centruy and the begining of the 20th century

 - [Read lesson](Amlit/Poetry19th20thIntro.html)
 - [Play level](Amlit/Poetry19th20th.html)

7. Early 20th century Realist Fiction

 - [Read lesson](Amlit/Realist20thIntro.html)
 - [Play level](Amlit/Realist20th.html)

8. Modernism and the Lost Generation

 - [Read lesson](Amlit/LostGenerationIntro.html)
 - [Play level](Amlit/LostGeneration.html)

9. American Fiction 1930s - 1950s

 - [Read lesson](Amlit/Fiction30s50sIntro.html)
 - [Play level](Amlit/Fiction30s50s.html)

10. American Fiction 1960s - 1980s

 - [Read lesson](Amlit/Fiction60s80sIntro.html)
 - [Play level](Amlit/Fiction60s80s.html)

11. Post-Modernism

 - [Read lesson](Amlit/PostModernismIntro.html)
 - [Play level](Amlit/PostModernism.html)

12. American Jewish Literature

 - [Read lesson](Amlit/JewishLiteratureIntro.html)
 - [Play level](Amlit/JewishLiterature.html)

13. American Poetry of the 20th century

 - [Read lesson](Amlit/Poetry20thIntro.html)
 - [Play level](Amlit/Poetry20th.html)

14. Representative American Drama

 - [Read lesson](Amlit/DramaIntro.html)
 - [Play level](Amlit/Drama.html)

15. African American and Native American Literature

 - [Read lesson](Amlit/AfricanAmericanIntro.html)
 - [Play level](Amlit/AfricanAmerican.html)
|]]

animateIntro f
 = flow down <| [veek f] ++
 ( if | f <  4 -> []
      | f >= 4 -> [vs]) ++
 ( if | f <  5 -> []
      | f >= 5 -> [exams]) ++
 ( if | f <  5-> []
      | f >= 5-> [usage]) ++
 ( if | f <  5-> []
      | f >= 5-> [levelLinks]) ++
 ( if | f <  5-> []
      | f >= 5-> [Nav.footer])

frame = foldp (\_ f->f+1) 0 (every (0.1 * second))

main = animateIntro <~ frame
