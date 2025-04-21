update resources set resourceimage = replace(replace(resourceLink,'/documents/', '/images/doc_thumbs/JPEG/'),'.pdf','.jpg') where year(resourcefiledate) = 2017 and resourceimage is null
				   update resources set resourceimage = replace(resourceimage,'doc-thumbs','doc_thumbs') where resourceimage like '%doc-thumbs%'
				   update resources set resourceimage = replace(resourceimage,'doc-thumb','doc_thumbs') where resourceimage like '%doc-thumb%'

		update resources set shortname = 'Agenda' where resourcename like '%Agenda%'
			  update resources set shortname = 'Meeting Minutes' where resourcename like '%meeting minutes%'

			  	  update resources set grouping = 'Photos' where year(resourcefiledate) = 2017
				  				  and resourcelink like '%jpg%'


				  update resources set resourceimage = replace(replace(resourceLink,'/documents/', '/images/doc_thumbs/JPEG/'),'.pdf','.jpg') 
				  where year(resourcefiledate) > 2015
				  and resourceimage like '%feature%'

				  	  update resources set resourceimage = replace(replace(resourceLink,'/documents/', '/images/doc_thumbs/JPEG/'),'.pdf','.jpg') 
				  where year(resourcefiledate) > 2015
				  and resourceimage = ''
				  and resourcelink like '%documents%'

update resources set resourceparentid = 2258 where resourceid = 2259

update resources set resourceparentid = 2260 where resourceid = 2261

update resources set resourceparentid = 2284 where resourceid = 2285

update resources set resourceparentid = 2286 where resourceid = 2287

update resources set resourceparentid = 2301 where resourceid = 2302

update resources set resourceparentid = 2301 where resourceid = 2318
update resources set resourceparentid = 2317 where resourceid = 2302

update resources set resourceparentid = 2317 where resourceid = 2318
update resources set resourceparentid = 2319 where resourceid = 2320

update resources set resourceparentid = 2325 where resourceid = 2326
update resources set resourceparentid = 1914 where resourceid = 1916
update resources set resourceparentid = 1915 where resourceid = 1913
update resources set shortname = 'International Best Practices Guide for Landfill Gas Energy Projects', resourceparentid = 1980 where resourceid in (1968,1969,1970,1977,1978,1979,1971, 1972, 1973, 1974, 1975, 1976)

update cross_resource_sector set sector = 'coal' where sector = 'Coal Mines'
update cross_resource_sector set sector = 'msw' where sector = 'Municipal Solid Waste'
update cross_resource_sector set sector = 'oilngas' where sector = 'Oil & Gas'
update cross_resource_sector set sector = 'steer' where sector = 'Steering'
update cross_resource_sector set sector = 'ww' where sector = 'Wastewater'
update cross_resource_sector set sector = 'agri' where sector = 'Agriculture'

update cross_resource_sector set sectorid = 6 where sector = 'oilngas'

UPDATE Resources
SET          resourceImage ='/images/event_feature_steering0.JPG'
FROM     Resources INNER JOIN
                  cross_resource_sector ON Resources.resourceID = cross_resource_sector.ResourceID
WHERE  (YEAR(Resources.resourceFiledate) > 2012) AND (Resources.resourceImage IS NULL OR
                  Resources.resourceImage = '') AND (cross_resource_sector.Sector = 'steer') AND (MONTH(Resources.resourceFiledate) < 7)

UPDATE Resources
SET          resourceImage ='/images/event_feature_steering1.JPG'
FROM     Resources INNER JOIN
                  cross_resource_sector ON Resources.resourceID = cross_resource_sector.ResourceID
WHERE  (YEAR(Resources.resourceFiledate) > 2012) AND (Resources.resourceImage IS NULL OR
                  Resources.resourceImage = '') AND (cross_resource_sector.Sector = 'steer') 
				  AND (MONTH(Resources.resourceFiledate) > 6)

UPDATE Resources
SET          resourceImage ='/images/event_feature_agriculture0.JPG'
FROM     Resources INNER JOIN
                  cross_resource_sector ON Resources.resourceID = cross_resource_sector.ResourceID
WHERE  (YEAR(Resources.resourceFiledate) > 2012) AND (Resources.resourceImage IS NULL OR
                  Resources.resourceImage = '') AND (cross_resource_sector.Sector = 'agri') AND (MONTH(Resources.resourceFiledate) < 7)

UPDATE Resources
SET          resourceImage ='/images/event_feature_agriculture1.JPG'
FROM     Resources INNER JOIN
                  cross_resource_sector ON Resources.resourceID = cross_resource_sector.ResourceID
WHERE  (YEAR(Resources.resourceFiledate) > 2012) AND (Resources.resourceImage IS NULL OR
                  Resources.resourceImage = '') AND (cross_resource_sector.Sector = 'agri') 
				  AND (MONTH(Resources.resourceFiledate) > 6)

UPDATE Resources
SET          resourceImage ='/images/event_feature_coalmines0.JPG'
FROM     Resources INNER JOIN
                  cross_resource_sector ON Resources.resourceID = cross_resource_sector.ResourceID
WHERE  (YEAR(Resources.resourceFiledate) > 2012) AND (Resources.resourceImage IS NULL OR
                  Resources.resourceImage = '') AND (cross_resource_sector.Sector = 'coal') AND (MONTH(Resources.resourceFiledate) < 7)

UPDATE Resources
SET          resourceImage ='/images/event_feature_coalmines1.JPG'
FROM     Resources INNER JOIN
                  cross_resource_sector ON Resources.resourceID = cross_resource_sector.ResourceID
WHERE  (YEAR(Resources.resourceFiledate) > 2012) AND (Resources.resourceImage IS NULL OR
                  Resources.resourceImage = '') AND (cross_resource_sector.Sector = 'coal') 
				  AND (MONTH(Resources.resourceFiledate) > 6)				  

	UPDATE Resources
SET          resourceImage ='/images/event_feature_oilandgas0.JPG'
FROM     Resources INNER JOIN
                  cross_resource_sector ON Resources.resourceID = cross_resource_sector.ResourceID
WHERE  (YEAR(Resources.resourceFiledate) > 2012) AND (Resources.resourceImage IS NULL OR
                  Resources.resourceImage = '') AND (cross_resource_sector.Sector = 'oilngas') AND (MONTH(Resources.resourceFiledate) < 7)

UPDATE Resources
SET          resourceImage ='/images/event_feature_oilandgas1.JPG'
FROM     Resources INNER JOIN
                  cross_resource_sector ON Resources.resourceID = cross_resource_sector.ResourceID
WHERE  (YEAR(Resources.resourceFiledate) > 2012) AND (Resources.resourceImage IS NULL OR
                  Resources.resourceImage = '') AND (cross_resource_sector.Sector = 'oilngas') 
				  AND (MONTH(Resources.resourceFiledate) > 6)				  



insert into cross_resource_topic (resourceid, topic, topicid) 
select resourceid, 'Proceedings',18 from resources where resourceid not in (select distinct resourceid from cross_resource_topic)
and year(resourcefiledate)>2012
and resourcename like '%agenda%'

insert into cross_resource_topic (resourceid, topic, topicid) 
select resourceid, 'Proceedings',18 from resources where resourceid not in (select distinct resourceid from cross_resource_topic)
and year(resourcefiledate)>2012
and resourcename like '%minutes%'
insert into cross_resource_topic (resourceid, topic, topicid) 
select resourceid, 'Country Updates',3 from resources where resourceid not in (select distinct resourceid from cross_resource_topic)
and year(resourcefiledate)>2012
and resourcelink like '%delegate_template%'

insert into cross_resource_topic (resourceid, topic, topicid) 
select resourceid, 'Country Updates',3 from resources where resourceid not in (select distinct resourceid from cross_resource_topic)
and year(resourcefiledate)>2012
and resourcename like '%update from%'

insert into cross_resource_topic (resourceid, topic, topicid) 
select resourceid, 'Country Updates',3 from resources where resourceid not in (select distinct resourceid from cross_resource_topic)
and year(resourcefiledate)>2012
and resourceid in (select distinct resourceid from cross_resource_event)


insert into cross_resource_topic (resourceid, topic, topicid) 
select resourceid, 'Sector Updates',4 from resources where resourceid not in (select distinct resourceid from cross_resource_topic)
and year(resourcefiledate)>2012
and resourcename like '%Subcommittee Updates%'

insert into cross_resource_topic (resourceid, topic, topicid) 
select resourceid, 'Sector Updates',4 from resources where resourceid not in (select distinct resourceid from cross_resource_topic)
and year(resourcefiledate)>2012
and resourcename like '%GMI Outreach%'

insert into cross_resource_topic (resourceid, topic, topicid) 
select resourceid, 'Sector Updates',4 from resources where resourceid not in (select distinct resourceid from cross_resource_topic)
and year(resourcefiledate)>2012
and resourcename like '%Recent Developments%'

insert into cross_resource_topic (resourceid, topic, topicid) 
select resourceid, 'Sector Updates',4 from resources where resourceid not in (select distinct resourceid from cross_resource_topic)
and year(resourcefiledate)>2012
and resourcelink like '%news-events/%'

insert into cross_resource_topic (resourceid, topic, topicid) 
select resourceid, 'Country Updates',3 from resources where resourceid not in (select distinct resourceid from cross_resource_topic)
and year(resourcefiledate)>2012
and resourcelink like '%toolsres_coal_overview%'

insert into cross_resource_topic (resourceid, topic, topicid) 
select resourceid, 'Proceedings',18 from resources where resourceid not in (select distinct resourceid from cross_resource_topic)
and year(resourcefiledate)>2012
and resourcelink like '%expo-docs%'

insert into cross_resource_topic (resourceid, topic, topicid) 
select resourceid, 'Proceedings',18 from resources where resourceid not in (select distinct resourceid from cross_resource_topic)
and year(resourcefiledate)>2012
and resourcelink like '%forum%'

insert into cross_resource_topic (resourceid, topic, topicid) 
select resourceid, 'Proceedings',18 from resources where resourceid not in (select distinct resourceid from cross_resource_topic)
and year(resourcefiledate)>2012
and resourcelink like '%documents/events%'
