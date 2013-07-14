//
//  FilmList.m
//  reel2013
//
//  Created by Luiz Gustavo Faria on 20/04/13.
//  Copyright (c) 2013 PDM Systems. All rights reserved.
//

#import "FilmList.h"

@implementation FilmList

static NSArray *_films;
static NSArray *_documentaries;

+(NSArray *)documentaries {
    return _documentaries;
}

+(void)fillTheArrays {
    
    NSDictionary *tropicalia        = @{@"Title": @"Tropicália",
                                        @"PtTitle": @"Tropicália",
                                        @"Description": @"‘Tropicalismo’ shook the structures of Brazilian popular music and influenced several generations. Brazil was suffering under a nationalist military regime when Caetano Veloso, Gilberto Gil, Tom Zé, Gal Costa, Arnaldo Baptista, Rita Lee, and many others, mixed Brazilian folk traditions with African music and rock and roll. With revealing interviews, rare archival footage and packed with songs from that period, Tropicália gives us a definitive picture of one of the most fascinating musical and artistic periods in Brazilian history.",
                                        @"Trailer":@"http://www.youtube.com/watch?v=E0z_5YBOb4M",
                                        @"Director":@"Marcelo Machado",
                                        @"Image":[UIImage imageNamed:@"doc-0"],
                                        @"Sessions":  @[@"AUCKLAND",@"Sun 21 April 5:30pm",@"Sat 27 April 4:45pm",@"Separator",@"WELLINGTON",@"Sun 05 May 6:30pm",@"Sun 12 May 6:15pm"]
,
                                        @"Info":@"2012  /  93 MIN  /  doco, music, 1960s & 1970s"};
    
    NSDictionary *worldIn2RoundTrips        = @{@"Title": @"The World in Two Round Trips",
                                                @"PtTitle":@"O mundo em duas voltas",
                                                @"Description": @"The youngest sailor on the Schürmann family’s round the world journey is five year old Kat. She’s a very little girl who gets a very big education: learning hula in Tahiti, horse-riding in Chile, tramping in the frozen desert wilds of Patagonia, while living on board the boat with her family. The documentary took 10 years to finish and includes images from 30 countries, 4 continents and 3 oceans. Director David Schürmann loved New Zealand so much, he stayed behind as a teenager to study film while his parents carried on sailing the world. As an adult, he joins his parents and little sister Kat, and films their second world trip. This film is an ode, to the beauty of the sea, to the intrepid spirit of Ferdinand Magellan, and to the love of family.",
                                                @"Trailer":@"http://www.youtube.com/watch?v=0ilZe-4NRZU",
                                                @"Director":@"David Schürmann",
                                                @"Image":[UIImage imageNamed:@"doc-1"],
                                                @"Sessions":  @[@"AUCKLAND",@"Sat 20 April 4:30pm",@"Thu 25 April 6:30pm",@"Sun 27 April 12:45pm",@"Separator",@"WELLINGTON",@"Sat 04 May 4:30pm",@"Thu 09 May 6:30pm",@"Sat 11 May 12:45pm"]
,
                                                @"Info":@"2007  /  93 MIN  /  doco, sailing, sport, travel, family"};
    
    NSDictionary *whoCares        = @{@"Title": @"Who Cares?",
                                      @"PtTitle":@"Quem se importa?",
                                      @"Description": @"Who cares? The stars of this documentary do, and they’re changing the world. Beautifully shot, inspiring - it’s a movement, not a film. Social entrepreneurship is not a phrase that easily rolls off the tongue, but once you see the film, you’ll be a believer. The people showcased are bringing solutions, generating huge social impact, and most of all, inspiring people to do the same. The film captures stories of everyday people in Brazil, Peru, Tanzania, Canada, Germany, Switzerland and the USA. “Informing but never lecturing, the film succeeds in conveying the importance of social innovation.” - Sarah Ward, artshub.com.au",
                                      @"Trailer":@"http://www.youtube.com/watch?v=yQNo7vRpgQI",
                                      @"Director":@"Mara Mourão",
                                      @"Image":[UIImage imageNamed:@"doc-2"],
                                      @"Sessions":  @[@"AUCKLAND",@"Tue 23 April 12:30pm",@"Tue 23 April 8:30pm",@"Thu 25 April 12:30pm",@"Sat 27 April 2:30pm",@"Separator",@"WELLINGTON",@"Tue 07 May 1:00pm",@"Wed 08 May 6:30pm",@"Thu 09 May 1:00pm",@"Sat 11 May 2:30pm"]
,
                                      @"Info":@"2012  /  93 MIN  /  Doco, Human rights, Social entrepreneurship"};
    
    NSDictionary *pirinop        = @{@"Title": @"Pirinop, My First Contact",
                                     @"PtTitle":@"Pirinop, meu primeiro contato",
                                     @"Description": @"The Americas “first contact” is widely recognized as having occurred in 1492. For the Ikpeng Indigenous people in Brazil, first contact was a documented event that occurred in 1964 and eventually led to the relocation of the Ikpeng people to the Xingu park in Brazil, far from their traditional territory. With spellbinding footage from the actual event and personal accounts of first impressions, this compelling documentary offers a rare glimpse into that historic event from the Indigenous point of view and captures the incredible impact that contact had on the lives of the Ikpeng people and how it continues to affect them to this day.  - ImagineNative Film Festival, Toronto, Canada.",
                                     @"Trailer":@"http://www.youtube.com/watch?v=dU6k_YQloOQ",
                                     @"Director":@"Mari Corrêa",
                                     @"Image":[UIImage imageNamed:@"doc-3"],
                                     @"Sessions":  @[@"AUCKLAND",@"Sun 21 April 1:30pm",@"Mon 22 April 2:30pm",@"Fri 26 April 6:30pm",@"Sun 28 April 5:30pm",@"Separator",@"WELLINGTON",@"Sun 05 May 2:30pm",@"Mon 06 May 1:00pm",@"Fri 10 May 6:30pm",@"Sun 12 May 4:30pm"],
                                     @"Info":@"2007  /  83 min  /  Documentary, Indigenous, Human rights"};
    
    NSDictionary *grandpaswatch        = @{@"Title": @"Grandpa's Watch",
                                           @"PtTitle":@"O relógio do meu avô",
                                           @"Description": @"The director goes on a journey to his grandfather's homeland, Transylvania, in search of an old watch his grandpa hid before the Nazis came to take the family to Auschwitz. The 70-minute documentary tells the story of immigrant Holocaust survivors who settled in Brazil after World War II. Through the pursuit by the film's director of the history of his Hungarian grandfather and ancestors, the memories of a dark time reappear in testimonials by survivors themselves. From Israel to Hungary, Poland, and Brazil, Heller tries to understand his family’s past, discovering dark secrets along the way.",
                                           @"Sessions":  @[@"AUCKLAND",@"Fri 19 April 2:30pm",@"Mon 22 April 6:30pm",@"Sun 28 April 1:30pm",@"Separator",@"WELLINGTON",@"Fri 03 May 1:00pm",@"Mon 06 May 8:30pm",@"Sun 12 May 2:30pm"],
                                           @"Trailer":@"http://www.youtube.com/watch?v=DyOXE5_i63E",
                                           @"Director":@"Alex Levy Heller",
                                           @"Image":[UIImage imageNamed:@"doc-4"],
                                           @"Info":@"2013  /  70 min  /  Doco, War, Historical, Jewish"};
    NSDictionary *twoRabbits    = @{@"Title": @"Two Rabbits",
                                    @"PtTitle":@"Dois Coelhos",
                                    @"Description": @"“Two Rabbits” is a gritty urban thriller pitting Edgar the mysterious anti-hero against the twin evils of politics and crime.  No-one is as they seem in this dark, fast-paced film set in Sao Paulo. Edgar has come home from two years in Miami, and quickly launches a scheme with a motorbike-riding mugger. Meanwhile, Julia, a prosecutor for the state, warns the gangster Maicon that he will be arrested any day; but what is her true motivation? Edgar, Maicon, Julia, a bent politician, a grieving father - the collision of lives and motives is epic and unexpected. Innovative cinematography, including animations, and plot twists galore will have cinema-goers on the edge of their seats.",
                                    @"Trailer":@"http://www.youtube.com/watch?v=Y-JWZB-PK9w",
                                    @"Director":@"Afonso Poyart",
                                    @"Sessions":@[@"AUCKLAND",@"Sat 20 April 8:30pm",@"Sun 21 April 8:30pm",@"Thu 25 April 8:30pm",@"Sat 27 April 6:30pm",@"Separator",@"WELLINGTON",@"Sat 04 May 8:30pm",@"Sun 05 May 4:30pm",@"Tue 07 May 8:30pm",@"Sat 11 May 6:45pm"],
                                    @"Image":[UIImage imageNamed:@"mov-0"],
                                    @"Info":@"2011  /  104 min  /  Action, Thriller, Animation"};
    
    
    NSDictionary *heleno        = @{@"Title": @"Heleno",
                                    @"PtTitle": @"Heleno",
                                    @"Description": @"Before Pelé, there was Heleno, a talented player whose arrogance and violent temper would destroy his life both on and off the field. The film will please both lovers of the sport and lovers of the Seventh Art. “In the early 1940’s, Rio was a glamorous oasis in a world ravaged by war. Film director Fonseca conjures this epoch in high-contrast black and white, evoking the films of the classic Hollywood era. Santoro (300, Love Actually, Behind the Sun) gives the performance of his career, effortlessly evoking Heleno’s glory days in a delectable combination of the cocksure and the charismatic.” - Toronto International Film Festival",
                                    @"Trailer":@"http://www.youtube.com/watch?v=_9xFTo6PDBU",
                                    @"Director":@"José Henrique Foncesca",
                                    @"Image":[UIImage imageNamed:@"mov-1"],
                                    @"Sessions":  @[@"AUCKLAND",@"Fri 19 April 8:30pm",@"Sun 21 April 7:30pm",@"Tue 23 April 6:15pm",@"Fri 26 April 8:30pm",@"Sun 28 April 3:15pm",@"Separator",@"WELLINGTON",@"Fri 03 May 8:30pm",@"Sun 05 May 8:30pm",@"Mon 06 May 6:15pm",@"Thu 09 May 8:30pm",@"Sun 12 May 8:15pm"]
,
                                    @"Info":@"2011  /  116 min  /  Drama, Football. Black & White"};
    
    
    NSDictionary *inTherapy        = @{@"Title": @"In Therapy",
                                       @"PtTitle":@"Divã",
                                       @"Description": @"“In Therapy” stars Lilia Cabral as Mercedes, a happily married 40-something with two children, who out of curiosity decides to see a psychoanalyst. Her sessions on the therapist’s couch lead her on a comic, and at times, dramatic journey of transformation, with young lovers, rave parties and a life she never knew she was missing. Her best friend Monica eggs her on, and Mercedes’ plain, middle-class life takes both surreal and poignant turns. Mercedes’ husband Gustavo adds to the comic tone - complaining she always has a drama when the football’s on tv - lending a “typical” Brazilian male perspective to the story.",
                                       @"Trailer":@"http://www.youtube.com/watch?v=lVtOMcqo27A",
                                       @"Director":@"José Alvarenga Jr.",
                                       @"Sessions":  @[@"AUCKLAND",@"Thu 18 April 6:00pm",@"Sat 20 April 2:30pm",@"Wed 24 April 5:30pm",@"Separator",@"WELLINGTON",@"Thu 02 May 6:00pm",@"Tue 07 May 6:30pm",@"Sat 11 May 8:45pm"]
,
                                       @"Image":[UIImage imageNamed:@"mov-2"],
                                       @"Info":@"2009  /  93 min  /  Romantic-comedy, Drama, Psychology"};
    
    NSDictionary *foundMemories        = @{@"Title": @"Found Memories",
                                           @"PtTitle":@"Histórias que só existem quando lembradas",
                                           @"Description": @"“This finely paced film has framed over 27 awards and was the official selection of more than 40 festivals around the globe. In a fictional town in Brazil where coffee plantations flourished in the 1800s, Rita, a young wandering photographer, comes to understand life in a community where time has stood still and people’s traditional roles clash with modern society. The film’s original title, “Stories That Only Exist When Remembered,” beautifully expresses the theme of Murat’s poetic rendering of the fictive Jotuomba, its inhabitants affectionately wedded to the rituals and land that contain the memories of their lives. Rita’s stay occasions a confluence of generations and cultures that seem to grow organically out of the setting in this extraordinarily accomplished and mature first feature. - indiewire.com",
                                           @"Trailer":@"http://www.youtube.com/watch?v=Re8_X75ZdOY",
                                           @"Director":@"Júlia Murat",
                                           @"Sessions":  @[@"AUCKLAND",@"Sat 20 April 6:30pm",@"Wed 24 April 8:15pm",@"Fri 26 April 2:30pm",@"Sun 28 April 7:30pm",@"Separator",@"WELLINGTON",@"Sat 04 May 6:30pm",@"Wed 08 May 8:30pm",@"Fri 10 May 1:00pm",@"Sat 11 May 4:45pm"]
,
                                           @"Image":[UIImage imageNamed:@"mov-3"],
                                           @"Info":@"2011  /  98 min  /  Photography, drama"};
    
    NSDictionary *dirtyHearts           = @{@"Title": @"Dirty Hearts",
                                         @"PtTitle":@"Corações Sujos",
                                         @"Description": @"“When Japan lost World War II, a new war started in Brazil. A war between the Japanese immigrants who accepted defeat, and those who did not. Based on a novel by award-winning Brazilian writer Fernando Morais, this fictional post-WWII drama depicts a real phenomenon. The Japanese community in Brazil, the largest outside of Japan, were treated as enemies in their new home. “Sequestered during the war and cut off from all Nippon publications, most immigrants refused to believe their country did not triumph. Fanatical societies sprang up, targeting those who acknowledged Japan's surrender as \"dirty hearts,\" and launching a murderous internecine campaign against them.” - Ronnie Scheib, Variety",
                                         @"Trailer":@"http://www.youtube.com/watch?v=0PfhKG9auNg",
                                         @"Director":@"Vicente Amorim",
                                            @"Sessions":  @[@"AUCKLAND",@"Fri 19 April 6:30pm",@"Mon 22 April 8:30pm",@"Wed 24 April 2:30pm",@"Sat 27 April 8:45pm",@"Separator",@"WELLINGTON",@"Fri 03 May 6:30pm",@"Wed 08 May 1:00pm",@"Fri 10 May 8:30pm"]
,
                                         @"Image":[UIImage imageNamed:@"mov-4"],
                                         @"Info":@"2011  /  90 min  /  Drama, War, Historical"};
    
    _films = @[twoRabbits,heleno,inTherapy,foundMemories,dirtyHearts];
    _documentaries = @[tropicalia,worldIn2RoundTrips,whoCares,pirinop,grandpaswatch];
}


+(NSArray *)films {
    return _films;
}

@end
