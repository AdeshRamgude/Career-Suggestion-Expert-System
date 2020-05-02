go:-
hypothesis(Course),
write('I believe that the you should choose '),
write(Course),
nl,
write('Congratulations '),
undo.

/*Hypothesis that should be tested*/
hypothesis(engineer) :- engineer, !.
hypothesis(doctor) :- doctor, !.
hypothesis(teacher) :- teacher, !.
hypothesis(journalist) :- journalist, !.
hypothesis(civil_service) :- civil_service, !.
hypothesis(ca) :- ca, !.
hypothesis(lawyer) :- lawyer, !.
hypothesis(defence) :- defence, !.
hypothesis(businessman) :- businessman, !.
hypothesis(actor) :- actor, !.
hypothesis(scientist) :- scientist, !.
hypothesis(bachelor_in_any_of_sci_arts_commerce).

/*Hypothesis Identification Rules*/

engineer :-
verify(like_maths),
verify(marks_more_than_150_in_jee),
verify(Interest_in_technology),
verify(like_research),
write('You_should_go_for_Engineering'),
nl.

doctor :-
verify(likes_biology),
verify(marks_more_than_400_in_neet),
verify(interest_in_medical),
verify(Ready_to_sacrifice_life),
write('You should go to medical'),
nl.

teacher :-
verify(interested_in_teaching),
verify(communication_skills),
verify(ready_to_learn_new_things),
verify(expert_in_any_subject),
write('You_should_go_to_teaching'),
nl.

journalist :-
verify(likes_travelling),
verify(having_good_general_knowledge),
verify(good_communication_skills),
verify(minimum_70_percentage_in_12th),
write('You should go to journalism'),
nl.

civil_service :-
verify(likes_social_work),
verify(likes_to_deal_with_people),
verify(good_communication_skills),
verify(good_general_knowledge),
verify(minimum_60_percentage_in_12th),
verify(good_management_skills),
write('You should go to civil_services'),
nl.

ca :-
verify(commerce),
verify(interest_in_accounting),
verify(interest_in_economy),
verify(minimum_70_percentage_in_12th),
write('You should go to CA'),
nl.

lawyer :-
verify(creative_in_problem_solving),
verify(interest_in_solving_cases),
verify(verbal_communication_skills),
verify(minimum_70_percentage_in_12th),
write('You should go to law'),
nl.

defence :-
verify(likes_discipline),
verify(brave),
verify(good_health),
verify(minimum_70_percentage_in_12th),
write('You should go to Defence'),
nl.

businessman :-
verify(likes_business),
verify(take_risk),
verify(decision_making),
verify(self_confidence),
write('You should go to Business'),
nl.

actor :-
verify(likes_acting),
verify(stage_dearing),
verify(acting_skills),
write('You should go to Acting'),
nl.

scientist :-
verify(interested_in_research),
verify(likes_inventing_new_things),
verify(work_with_dedication),
verify(minimum_70_percentage_in_12th),
write('You should go to Research'),
nl.


/* how to ask questions */
ask(Question) :-
write('Does the student have following qualities '),
write(Question),
write('? '),
read(Response),
nl,
( (Response == yes ; Response == y)
->
assert(yes(Question)) ;
assert(no(Question)), fail).

:- dynamic yes/1,no/1.
/*How to verify something */
verify(S) :-
(yes(S)
->
true ;
(no(S)
->
fail ;
ask(S))).
/* undo all yes/no assertions*/
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.