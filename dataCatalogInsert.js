const {DataCatalogClient} = require('@google-cloud/datacatalog').v1;
const datacatalog = new DataCatalogClient();

async function setMetadata({ projectId, dataset, table, fields}) {
  let request;
  let responses;
  const location = 'southamerica-west1';
  responses = await datacatalog.lookupEntry({
    linkedResource:
      '//bigquery.googleapis.com/projects/' +
      `${projectId}/datasets/${dataset}/tables/${table}`,
  });
  const tagTemplatePath = datacatalog.tagTemplatePath(
    projectId,
    location,
    "bch_data_governance"
  );
  const emptyTag = {
    NOM: { stringValue: 'null' },
    DOM: { stringValue: 'null' },
    SUB: { stringValue: 'null' },
    DSC: { stringValue: 'null' },
    PRO: { stringValue: 'null' },
    ADM: { stringValue: 'null' },
    TEC: { stringValue: 'null' }
  }
  const entry = responses[0];
  const tag = {
    name: entry.name,
    template: tagTemplatePath ,
    fields: {
      ...emptyTag,
      ...fields
    }
  }

  request = {
    parent: entry.name,
    tag: tag,
  };
  console.log(request.tag.fields)
  try {
    await datacatalog.createTag(request);
  } catch (ex) {
    console.log(ex.details);
  }
  
  console.log(`Tag created for entry: ${table}`);
}

module.exports = setMetadata;


