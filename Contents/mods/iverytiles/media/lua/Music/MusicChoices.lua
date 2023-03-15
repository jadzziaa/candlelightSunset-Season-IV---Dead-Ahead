
MusicChoices = {

    drama = 0,
    last = "",

    compareByDrama = function (a, b)
        --   SurvivorSelector.contextwith = with;
        -- SurvivorSelector.contextagainst = against;
            local totala = math.abs(MusicChoices.drama - a.scores.drama) - a.scores.bias;
            local totalb = math.abs(MusicChoices.drama - b.scores.drama) - b.scores.bias;
            if MusicChoices.last == a.file then
                totala = 100000;
            end
            if MusicChoices.last == b.file then
                totalb = 100000;
            end

            if(totala < totalb) then
                return true
            else
                return false
            end
        end,

    get = function(drama)

        MusicChoices.drama = drama;
       table.sort(MusicChoices.choices, MusicChoices.compareByDrama);
       local c = 0;
       for i, k in ipairs(MusicChoices.choices) do
          c = c + 1;
       end
       c = c * 0.2;
       local i = ZombRand(c)+1;


        MusicChoices.last =  MusicChoices.choices[i].file;
        return MusicChoices.choices[i].file;
    end,

    choices = {

        {
            file="paws1",
            scores = {
                drama = 2,
                bias = 4,
            }
        },
        {
            file="paws2",
            scores = {
                drama = 2,
                bias = 3,
            }
        },
        {
            file="paws3",
            scores = {
                drama = 2,
                bias = 3,
            }
        },
		{
            file="paws4",
            scores = {
                drama = 2,
                bias = 3,
            }
        }
    }

}
