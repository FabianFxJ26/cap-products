using {com.logali as logali} from '../db/schema';

service CustomerService {
    entity CustomerSv as projection on logali.Customer;
}
