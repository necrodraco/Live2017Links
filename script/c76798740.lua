--Vendread Charge
--Scripted by Eerie Code
function c76798740.initial_effect(c)
	--activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCountLimit(1,76798740+EFFECT_COUNT_CODE_OATH)
	e1:SetCost(c76798740.cost)
	e1:SetTarget(c76798740.target)
	e1:SetOperation(c76798740.activate)
	c:RegisterEffect(e1)
end
function c76798740.cfilter(c,ft)
	return c:IsRace(RACE_ZOMBIE) and (c:IsFaceup() or c:IsLocation(LOCATION_HAND)) and c:IsAbleToGraveAsCost() 
		and (ft>0 or (c:IsLocation(LOCATION_MZONE) and c:GetSequence()<5))
end
function c76798740.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	local ft=Duel.GetLocationCount(tp,LOCATION_MZONE)
	if chk==0 then return ft>-1 and Duel.IsExistingMatchingCard(c76798740.cfilter,tp,LOCATION_HAND+LOCATION_MZONE,0,1,nil,ft) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
	local g=Duel.SelectMatchingCard(tp,c76798740.cfilter,tp,LOCATION_HAND+LOCATION_MZONE,0,1,1,nil,ft)
	Duel.SendtoGrave(g,REASON_COST)
end
function c76798740.filter(c,e,tp)
	return c:IsSetCard(0x106) and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
end
function c76798740.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c76798740.filter,tp,LOCATION_DECK,0,1,nil,e,tp) end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_DECK)
end
function c76798740.activate(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetLocationCount(tp,LOCATION_MZONE)<1 then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectMatchingCard(tp,c76798740.filter,tp,LOCATION_DECK,0,1,1,nil,e,tp)
	if g:GetCount()>0 then
		Duel.SpecialSummon(g,0,tp,tp,false,false,POS_FACEUP)
	end
end
