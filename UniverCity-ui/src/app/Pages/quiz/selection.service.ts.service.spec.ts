import { TestBed } from '@angular/core/testing';

import { SelectionServiceTsService } from './selection.service.ts.service';

describe('SelectionServiceTsService', () => {
  let service: SelectionServiceTsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SelectionServiceTsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
